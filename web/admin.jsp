<%@page import="Model.User"%>
<%@page import="DataAccessor.UserDAO"%>
<%@page import="Model.Product"%>
<%@page import="DataAccessor.ProductDAO"%>
<%@page import="Model.PaidOrder"%>
<%@page import="java.util.List"%>
<%@page import="DataAccessor.PaidOrderDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- Title Page-->
        <title>Admin Imba Shop</title>

        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/admin.css" rel="stylesheet" media="all">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    </head>

    <body class="animsition">
        <%
            if (session.getAttribute("user_email") == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>
        <div class="page-wrapper">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop3 d-none d-lg-block">
                <div class="section__content section__content--p35">
                    <div class="header3-wrap">
                        <div class="header__logo">
                            <a href="admin.jsp">
                                <h3>Imba Shop</h3>
                            </a>

                        </div>
                        <div class="header__navbar">
                            <ul class="list-unstyled">
                                <li>
                                    <a href="admin.jsp">
                                        <i class="fas fa-tachometer-alt"></i>Dashboard
                                        <span class="bot-line"></span>
                                    </a>

                                </li>
                                <li>
                                    <a href="adminproduct.jsp">
                                        <i class="fas fa-shopping-basket"></i>
                                        <span class="bot-line"></span>Product</a>
                                </li>
                                <li>
                                    <a href="adminuser.jsp">
                                        <i class="fas fa-shopping-basket"></i>
                                        <span class="bot-line"></span>User</a>
                                </li>


                            </ul>
                        </div>
                        <div class="header__tool">


                            <div class="account-wrap">
                                <div class="account-item account-item--style2 clearfix js-item-menu">
                                    <div class="image">
                                        <img src="images/admin.png" alt="" />
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn" href="#">Admin</a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="images/admin.png" alt="" />
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#">Admin</a>
                                                </h5>
                                                <span class="email">admin@imbashop.com</span>
                                            </div>
                                        </div>

                                        <div class="account-dropdown__footer">
                                            <a href="LogoutController">
                                                <i class="zmdi zmdi-power"></i>Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- END HEADER DESKTOP-->

            <!-- HEADER MOBILE-->
            <header class="header-mobile header-mobile-2 d-block d-lg-none">
                <div class="header-mobile__bar">
                    <div class="container-fluid">
                        <div class="header-mobile-inner">
                            <a href="admin.jsp">
                                <h3>Imba Shop</h3>
                            </a>
                            <button class="hamburger hamburger--slider" type="button">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
                <nav class="navbar-mobile">
                    <div class="container-fluid">
                        <ul class="navbar-mobile__list list-unstyled">
                            <li>
                                <a href="admin.jsp">
                                    <i class="fas fa-tachometer-alt"></i>Dashboard
                                    <span class="bot-line"></span>
                                </a>

                            </li>
                            <li>
                                <a href="adminproduct.jsp">
                                    <i class="fas fa-shopping-basket"></i>
                                    <span class="bot-line"></span>Product</a>
                            </li>
                            <li>
                                <a href="adminuser.jsp">
                                    <i class="fas fa-shopping-basket"></i>
                                    <span class="bot-line"></span>User</a>
                            </li>



                        </ul>
                    </div>
                </nav>
            </header>
            <div class="sub-header-mobile-2 d-block d-lg-none">
                <div class="header__tool">

                    <div class="account-wrap">
                        <div class="account-item account-item--style2 clearfix js-item-menu">
                            <div class="image">
                                <img src="images/admin.png" alt="" />
                            </div>
                            <div class="content">
                                <a class="js-acc-btn" href="#">admin</a>
                            </div>
                            <div class="account-dropdown js-dropdown">
                                <div class="info clearfix">
                                    <div class="image">
                                        <a href="#">
                                            <img src="images/admin.png" alt="" />
                                        </a>
                                    </div>
                                    <div class="content">
                                        <h5 class="name">
                                            <a href="#">admin</a>
                                        </h5>
                                        <span class="email">admin@imbashop.com</span>
                                    </div>
                                </div>
                                <div class="account-dropdown__body">
                                    <div class="account-dropdown__item">
                                        <a href="#">
                                            <i class="zmdi zmdi-account"></i>Account</a>
                                    </div>
                                    <div class="account-dropdown__item">
                                        <a href="LogoutController">
                                            <i class="zmdi zmdi-money-box"></i>Billing</a>
                                    </div>
                                </div>
                                <div class="account-dropdown__footer">
                                    <a href="index.jsp">
                                        <i class="zmdi zmdi-power"></i>Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END HEADER MOBILE -->

            <!-- PAGE CONTENT-->
            <div class="page-content--bgf7">
                <!-- BREADCRUMB-->
                <section class="au-breadcrumb2">

                </section>
                <!-- END BREADCRUMB-->

                <!-- WELCOME-->
                <section class="welcome p-t-10">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
                                    Welcome back,
                                    <span>Admin</span></h3>
                                <hr class="line-seprate">
                            </div>
                        </div>
                    </div>
                </section>
                <!-- END WELCOME-->

                <!-- STATISTIC-->
                <section class="statistic statistic2">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item statistic__item--green">
                                    <h2 class="number">
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imbashop", "root", "");
                                                Statement st = con.createStatement();
                                                String strQuery = "SELECT COUNT(*) FROM users WHERE type='user'";
                                                ResultSet rs = st.executeQuery(strQuery);
                                                String Countrow = "";
                                                while (rs.next()) {
                                                    Countrow = rs.getString(1);
                                                    out.println(Countrow);
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %></h2>
                                    <span class="desc">members Registered</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item statistic__item--orange">
                                    <h2 class="number"> <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imbashop", "root", "");
                                            Statement st = con.createStatement();
                                            String strQuery = "SELECT COUNT(*) FROM paid_orders";
                                            ResultSet rs = st.executeQuery(strQuery);
                                            String Countrow = "";
                                            while (rs.next()) {
                                                Countrow = rs.getString(1);
                                                out.println(Countrow);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                        %></h2>
                                    <span class="desc">items sold</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item statistic__item--blue">
                                    <h2 class="number"> <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imbashop", "root", "");
                                            Statement st = con.createStatement();
                                            String paid = "paid";
                                            String strQuery = "SELECT COUNT(*) FROM products";
                                            ResultSet rs = st.executeQuery(strQuery);
                                            String Countrow = "";
                                            while (rs.next()) {
                                                Countrow = rs.getString(1);
                                                out.println(Countrow);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                        %></h2>
                                    <span class="desc">Total Item in the store</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item statistic__item--red">
                                    <h2 class="number"><%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imbashop", "root", "");
                                            Statement st = con.createStatement();
                                            String paid = "paid";
                                            String strQuery = "SELECT COUNT(*) FROM paid_orders where status='" + paid + "';";
                                            ResultSet rs = st.executeQuery(strQuery);
                                            String Countrow = "";
                                            while (rs.next()) {
                                                Countrow = rs.getString(1);
                                                out.println(Countrow);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                        %></h2>
                                    <span class="desc">total item has not been shipped</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-truck"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- END STATISTIC-->

                <!-- STATISTIC CHART-->
                <section class="statistic-chart">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="title-5 m-b-35">statistics</h3>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6 col-lg-4">
                                <!-- TOP User-->
                                <div class="top-campaign">
                                    <h3 class="title-3 m-b-30">Top Customers</h3>
                                    <div class="table-responsive">
                                        <table class="table table-top-item">
                                            <tbody>
                                                <%
                                                    UserDAO usr = new UserDAO();
                                                    List<User> userlist = usr.getAllUserBy5();
                                                    for (User u : userlist) {
                                                %>
                                                <tr>
                                                    <td> <%=  u.getName()%></td>

                                                </tr>
                                                <%
                                                    }

                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- END TOP USER-->
                            </div>

                            <div class="col-md-6 col-lg-4">
                                <!-- TOP User-->
                                <div class="top-item">
                                    <h3 class="title-3 m-b-30">Top Items</h3>
                                    <div class="table-responsive">
                                        <table class="table table-top-item">
                                            <tbody>
                                                <%                                                    ProductDAO pro = new ProductDAO();
                                                    List<Product> productlist = pro.getAllProductBy5();
                                                    for (Product p : productlist) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <%=  p.getPname()%>
                                                    </td>
                                                </tr>
                                                <%
                                                    }

                                                %>




                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- END TOP USER-->
                            </div>


                        </div>
                    </div>
                </section>
                <!-- END STATISTIC CHART-->



                <!-- History-->
                <section class="p-t-20">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="title-5 m-b-35">Transaction History</h3>

                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>Email</th>
                                                <th>Items</th>
                                                <th>Price</th>
                                                <th>Address</th>
                                                <th>Status</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  
                                                PaidOrderDAO dao = new PaidOrderDAO();
                                                List<PaidOrder> orderList = dao.getAllPaidOrder();
                                                for (PaidOrder o : orderList) {
                                            %>

                                            <tr class="tr-shadow">


                                                <td>
                                                    <span class="block-email"><%= o.getUser_email()%></span>
                                                </td>
                                                <td><%= o.getPname()%></td>
                                                <td><%= o.getPrice()%></td>
                                                <td><%= o.getAddress()%></td>
                                                <%
                                                    if (o.getStatus().equals("paid")) {
                                                %>
                                                <td>
                                                    <font color="#E6B80F"><%= o.getStatus()%></font>
                                                </td>

                                                <td>
                                                    <a href="AdminUpdateStatusController?action=update&id=<%= o.getId()%>" class="btn btn-sm btn-danger">Update Status</a>
                                                </td>
                                                <%
                                                } else {
                                                %>

                                                <td>
                                                    <font color="green"><%= o.getStatus()%></font>
                                                </td>

                                                <td>

                                                    <button class="item" disabled data-toggle="modal" data-target="#EditItems"  data-placement="top" title="Edit">Completed</a></button>

                                                </td>

                                                <%
                                                    }
                                                %>

                                                <%
                                                    }
                                                %>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>


                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- END DATA TABLE-->

                <section class="p-t-60 p-b-20">


            </div>

            <!-- copyright -->
            <div class="copy-right py-3">
                <div class="container">
                    <p class="text-center text-white">2019 IMBA Store.&copy;
                    </p>
                </div>
            </div>
            <!-- //copyright -->

        </div>

        <!-- Jquery JS-->
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendor/slick/slick.min.js">
        </script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/animsition/animsition.min.js"></script>
        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendor/circle-progress/circle-progress.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="js/admin.js"></script>


        <!-- scroll seller -->
        <script src="js/scroll.js"></script>
        <!-- //scroll seller -->

        <!-- smoothscroll -->
        <script src="js/SmoothScroll.min.js"></script>
        <!-- //smoothscroll -->

        <!-- start-smooth-scrolling -->
        <script src="js/move-top.js"></script>
        <script src="js/easing.js"></script>
        <script>
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event) {
                    event.preventDefault();

                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    }, 1000);
                });
            });
        </script>
        <!-- //end-smooth-scrolling -->

        <!-- smooth-scrolling-of-move-up -->
        <script>
            $(document).ready(function() {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear'
                 };
                 */
                $().UItoTop({
                    easingType: 'easeOutQuart'
                });

            });
        </script>
        <!-- //smooth-scrolling-of-move-up -->

    </body>

</html>
<!-- end document-->
