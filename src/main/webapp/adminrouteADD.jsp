
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connection.ConnectionManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark"
    data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
    <style>




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

                          
                            <div class="card card-height-100">
                              <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">Add New Route </h4>
					  			
                   	
                                </div>
                            <div class="card-body">
                                <br>
                                <form method="POST" action="routeServlet">
                               
                                <h4 class="card-title mb-0 flex-grow-1"> Route </h4>
                                <br>
                               <input type="hidden" class="form-control"  name="command" value="addroute"  >

                                    <div class="row mb-3">
                                        <div class="col-lg-3">
                                            <label for="nameInput" class="form-label">From</label>
                                        </div>
                                        <div class="col-lg-9">
                                                <input type="text" class="form-control" id="nameInput" name="fromRoute"  placeholder="Enter bus pickup"  >
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-3">
                                            <label for="nameInput" class="form-label"  >To</label>
                                        </div>
                                        <div class="col-lg-9">
                                                <input type="text" class="form-control" id="nameInput" name="toRoute"  placeholder="Enter bus drop"  >
                                        </div>
                                    </div>
                                <h4 class="card-title mb-0 flex-grow-1"> Choose Effective Date </h4>
                                <br> 
                                    <div class="row mb-3">
                                        <div class="col-lg-3">
                                            <label for="nameInput" class="form-label"  >From</label>
                                        </div>
                                        <div class="col-lg-9">
                                                <input type="Date" class="form-control" id="nameInput" name="fromDate"  placeholder="Enter bus drop"  >
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-3">
                                            <label for="nameInput" class="form-label"  >To</label>
                                        </div>
                                        <div class="col-lg-9">
                                                <input type="Date" class="form-control" id="nameInput" name="toDate"  placeholder="Enter bus drop"  >
                                        </div>
                                    </div>
                                    
                                    	 <button type="submit" class="btn btn-success">Submit</button>
                                
                          </form>
                        
                       
                        

 
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