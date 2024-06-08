
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connection.ConnectionManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark"
    data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
    <style>
    .btn-update {
    display: inline-block;
    padding: 8px 16px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.btn-update:hover {
    background-color: #0056b3;
}
    
/* Button style */
button {
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s;
}


.btn-delete {
    background-color: #dc3545; 
}

.btn-update {
    background-color: #28a745; 
}

button:hover {
    background-color: #0056b3;
}


.button-group {
    display: flex;
    gap: 8px; 
}




 button {
     border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 10px 20px;
    margin-bottom :10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s;
}

 button:hover {
    background-color: #0056b3;
}

    </style>
    <head>

        <meta charset="utf-8" />
        <title>Bus Ticketing System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template"
            name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="./assets/images/favicon.ico">

        <!-- jsvectormap css -->
        <link href="./assets/libs/jsvectormap/css/jsvectormap.min.css"
            rel="stylesheet" type="text/css" />

        <!--Swiper slider css-->
        <link href="./assets/libs/swiper/swiper-bundle.min.css"
            rel="stylesheet" type="text/css" />

        <!-- Layout config Js -->
        <script src="./assets/js/layout.js"></script>
        <!-- Bootstrap Css -->
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet"
            type="text/css" />
        <!-- Icons Css -->
        <link href="./assets/css/icons.min.css" rel="stylesheet"
            type="text/css" />
        <!-- App Css-->
        <link href="./assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="./assets/css/custom.min.css" rel="stylesheet"
            type="text/css" />
    </head>

    <body>

        <!-- Begin page -->
        <div id="layout-wrapper">

            <header id="page-topbar">
                <div class="layout-width">
                    <div class="navbar-header">
                        <div class="d-flex align-items-center">

                        </div>
                    </div>
                </div>
            </header>
           
            <div class="app-menu navbar-menu">
               
                <div class="navbar-brand-box">
                    <a href="index.html" class="logo logo-light">

                        <span class="logo-lg">
                            <img src="./logo.png" alt height="80">
                            <h4><b>Bus Ticketing System</b></h4>
                        </span>
                    </a>

                </div>

                <div id="scrollbar">
                    <div class="container-fluid">

                        <div id="two-column-menu">
                        </div>
                         <ul class="navbar-nav" id="navbar-nav">
                            <li class="menu-title"><span data-key="t-menu">Menu</span></li>
                            <li class="nav-item">
                                 <a class="nav-link menu-link" href="adminhome.jsp">
                                    <i class="mdi mdi-home"></i> <span
                                        data-key="t-dashboards">Home</span>
                                </a>
                            </li> <!-- end Dashboard Menu -->
                            <li class="nav-item">
                                <a class="nav-link menu-link" href="adminroute.jsp">
                                    <i class="mdi mdi-map-marker"></i>

                                    <span data-key="t-authentication">Route</span>
                                </a>
                                <a class="nav-link menu-link" href="admintrip.jsp">
                                   <i class="mdi mdi-bus"></i>

                                    <span data-key="t-authentication">Trip</span>
                                </a>
                               <a class="nav-link menu-link" href="adminfare.jsp">
                                  <i class="mdi mdi-currency-usd"></i>

                                    <span data-key="t-authentication">Ticket Fare</span>
                                </a>
                                <a class="nav-link menu-link" href="adminseat.jsp">
                                   <i class="mdi mdi-seat"></i>

                                    <span data-key="t-authentication">Seat</span>
                                </a>
                            </li>
                            <hr>
                            <li class="nav-item">
                                <a class="nav-link menu-link" href="logout.jsp">
                                  
                                    <i class="mdi mdi-logout "></i> <span
                                        data-key="t-authentication">Log Out</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                
                </div>

                <div class="sidebar-background"></div>
            </div>
            
            <div class="vertical-overlay"></div>

            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                          <div class="card">

                              
                </div>

                           <button onclick="window.location.href='adminrouteADD.jsp';">Add Route</button>
                            <div class="card card-height-100">
                              <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">Route List</h4>
					  			
                   	
                                </div>
                                <div class="card-body">
<table class="table table-nowrap" id="complaintsTable">
    <thead class="table-light">
        <tr>
            <th scope="col" width="5%">Route No</th>

            <th scope="col" width="10%">Start Date</th>
            <th scope="col" width="10%">End Time</th>
                        <th scope="col" width="10%">Pickup</th>
            <th scope="col" width="10%">Drop</th>
            <th scope="col" width="10%">Action</th>
        </tr>
    </thead>
    <tbody>
        <% 
            Connection con = null;
            try {
               
                con = ConnectionManager.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM route");
                while (rs.next()) {
                    String id = rs.getString("route_id");
                    String startdate = rs.getString("route_startdate");
                    String enddate = rs.getString("route_enddate");
                    String from = rs.getString("route_from");
                    String to = rs.getString("route_to");
        %>
        <tr>
            <td>MYSR <%= id %></td>
            <td><%= startdate %></td>
            <td><%= enddate %></td>
            <td><%= from %></td>
            <td><%= to %></td>
            <td>
			    <div class="button-group">
			   	    
			   	     <a href="adminrouteUPDATE.jsp?id=<%= id %>" class="btn-update">Edit</a>
			   	    <script>
						function confirmDelete() {
						    return confirm("Are you sure want to delete this route?");
						}
					</script>
					<form action="routeServlet" method="post" style="display: inline ;">
				        <input type="hidden" name="command" value="delete">
				        <input type="hidden" name="routeid" value="<%= id %>">
				        <button type="submit" class="btn-delete" onclick="return confirmDelete()">Delete</button>
				    </form>

			        
			    </div>
			</td>

           
        </tr>
        <% // End of Java code block
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        %>
    </tbody>
</table>


 
    <br>
                                 </div>
                        </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

            </div>
            <!-- end main content-->

        </div>
        <!-- END layout-wrapper -->

        <!--start back-to-top-->
        <button onclick="topFunction()" class="btn btn-danger btn-icon"
            id="back-to-top">
            <i class="ri-arrow-up-line"></i>
        </button>
        <!--end back-to-top-->

      

        <!-- JAVASCRIPT -->
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        <script src="assets/libs/feather-icons/feather.min.js"></script>
        <script src="assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
        <script src="assets/js/plugins.js"></script>

        <!-- apexcharts -->
        <script src="assets/libs/apexcharts/apexcharts.min.js"></script>

        <!-- Vector map-->
        <script src="assets/libs/jsvectormap/js/jsvectormap.min.js"></script>
        <script src="assets/libs/jsvectormap/maps/world-merc.js"></script>

        <!-- Dashboard init -->
        <script src="assets/js/pages/dashboard-analytics.init.js"></script>

        <!-- App js -->
        <script src="assets/js/app.js"></script>
    </body>

</html>