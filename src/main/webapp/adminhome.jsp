
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark"
    data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
    <style>
        chart {
    width: 100%;
    margin: 50px auto;
}
  .progress-container {
    margin-bottom: 20px;
    clear: both;
  table {
    width: 100%;
    margin-bottom: 20px;
     clear: both;
    
  }
.bar {
    height: 40px;
    line-height: 40px;
    color: white;
    text-align: center;
    margin-bottom: 10px;
}
        </style>
        
    <style>
        .line-container {
            position: relative;
            margin-top: 20px;
        }

        .line {
            border: 0;
            height: 1px; /* Adjust line height */
            background-color: grey;
            width: 80%;
        }

        .tick-mark {
            position: absolute;
            height: 6px; /* Adjust tick mark height */
            width: 1px; /* Adjust tick mark width */
            bottom: 1px;
            background-color: grey;
        }



        .tick-mark-0 {
            left: 0%;
        }

        .tick-mark-20 {
            left: 16%;
        }

        .tick-mark-40 {
            left: 32%;
        }

        .tick-mark-60 {
            left: 48%;
        }

        .tick-mark-80 {
            left: 64%;
        }

        .tick-mark-100 {
            left: 80%;
        }
        
        .tick-label {
    position: absolute;
    bottom: -20px; /* Adjust the distance of labels from the line */
    left: 50%; /* Position labels at the center of the tick marks */
    transform: translateX(-50%); /* Center the label horizontally */
    font-size: 12px; /* Adjust label font size */
    color: black; /* Adjust label color */
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
                    <div class="card-header" id="welcomeMessage">
                       
                    </div>
                              
                </div>

                          <h4><b>Welcome</b></h4>
                            <div class="card card-height-100">
                              <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">Nothing to see here</h4>

                   
                                </div>
                                <div class="card-body">


 
    <br>
                                 </div><!-- end card body -->
                        </div><!-- end card -->

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