
<%@page import="Model.PaidOrder"%>
<%@page import="DataAccessor.PaidOrderDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="Model.Order"%>
<%@page import="DataAccessor.OrderDAO"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>IMBA Computer Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />

        <script>
            addEventListener("load", function() {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <!-- //Meta tag Keywords -->

        <!-- Custom-Files -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Bootstrap css -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Main css -->
        <link rel="stylesheet" href="css/fontawesome-all.css">
        <!-- Font-Awesome-Icons-CSS -->
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!-- pop-up-box -->
        <link href="css/menu.css" rel="stylesheet" type="text/css" media="all" />


        <!-- menu style -->
        <!-- //Custom-Files -->

        <!-- web fonts -->
        <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
              rel="stylesheet">
        <!-- //web fonts -->

    </head>

    <body>
        <%
            if (session.getAttribute("user_email") == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>
        <!-- top-header -->
        <div class="agile-main-top">
            <div class="container-fluid">
                <div class="row main-top-w3l py-2">
                    <div class="col-lg-4 header-most-top">
                        <p class="text-white text-lg-left text-center">Shopping here to become a pro gamer
                            <i class="fas fa-shopping-cart ml-1"></i>
                        </p>
                    </div>
                    <div class="col-lg-8 header-right mt-lg-0 mt-2">
                        <!-- header lists -->
                        <ul>
                            <li class="text-center border-right text-white"></li>
                            <li class="text-center border-right text-white"></li>
                            <a>
                                <li class="text-center border-right text-white">
                                    <i class="fas fa-dollar-sign mr-2"></i>MYR</a>
                            </li>
                            <%
                                String user = (String) session.getAttribute("user_email");
                                {
                            %>
                            <li class="text-center text-white">
                                <a href="#" data-toggle="modal" data-target="#modeleditprofile" class="text-white">
                                    <i class="fas fa-user"></i> <%=user%> [Edit]</a>
                            </li>
                            <%
                                }
                            %>

                            <li class="text-center border-left text-white">
                                <a href="LogoutController"  class="text-white">
                                    <i class="fas fa-sign-out-alt"></i> Logout </a>
                            </li>
                        </ul>
                        <!-- //header lists -->
                    </div>
                </div>
            </div>
        </div>



        <!-- modals -->

        <!--to send the value of email to the customerprofile.jsp-->
        <div class="modal fade" id="modeleditprofile" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Are you sure to edit your profile?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="CustomerProfileController" method="post">
                            <input type="hidden"  value="<%=user%>" name="email">


                            <div class="right-w3l">
                                <input type="submit" class="form-control" value="Yes">

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- end of -> to send the value of email to the customerprofile.jsp-->

        <!-- log in -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center">Log In</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="box" action="customerprofile.html" method="post">
                            <div class="form-group">
                                <label class="col-form-label">Email</label>
                                <input type="text" class="form-control" placeholder=" " name="Email" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Password</label>
                                <input type="password" class="form-control" placeholder=" " name="Password" required="">
                            </div>
                            <div class="right-w3l">
                                <input type="submit" class="form-control" value="Log in">
                            </div>
                            <div class="sub-w3l">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                    <label class="custom-control-label" for="customControlAutosizing">Remember me?</label>
                                </div>
                            </div>
                            <p class="text-center dont-do mt-3">Don't have an account?
                                <a href="#" data-toggle="modal" data-target="#exampleModal2">
                                    Register Now</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- register -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Register</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#" method="post">
                            <div class="form-group">
                                <label class="col-form-label">Your Name</label>
                                <input type="text" class="form-control" placeholder=" " name="Name" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Email</label>
                                <input type="email" class="form-control" placeholder=" " name="Email" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Password</label>
                                <input type="password" class="form-control" placeholder=" " name="Password" id="password1" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Confirm Password</label>
                                <input type="password" class="form-control" placeholder=" " name="Confirm Password" id="password2" required="">
                            </div>
                            <div class="right-w3l">
                                <input type="submit" class="form-control" value="Register">
                            </div>
                            <div class="sub-w3l">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="customControlAutosizing2">
                                    <label class="custom-control-label" for="customControlAutosizing2">I Accept to the Terms & Conditions</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
        <!-- //top-header -->


        <!-- header-bottom-->
        <div class="header-bot">
            <div class="container">
                <div class="row header-bot_inner_wthreeinfo_header_mid">
                    <!-- logo -->
                    <div class="col-md-3 logo_agile">
                        <h1 class="text-center">
                            <a href="#" class="font-weight-bold font-italic">
                                <!-- <img src="images/alien.png" width="75" height="75" alt=" " class="img-fluid"> -->
                                IMBA Shop
                            </a>
                        </h1>
                    </div>
                    <!-- //logo -->
                    <!-- header-bot -->
                    <div class="col-md-9 header mt-4 mb-md-0 mb-4">
                        <div class="row">
                            <!-- search -->
                            <div class="col-10 agileits_search">
                                <form class="form-inline" action="search.jsp" method="post">
                                    <input class="form-control mr-sm-2" name="pname" type="search" placeholder="Search" aria-label="Search" required>
                                    <button class="btn my-2 my-sm-0" type="submit"><span>Search</span></button>
                                </form>
                            </div>
                            <!-- //search -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- shop locator (popup) -->
        <!-- //header-bottom -->
        <!-- navigation -->
        <div class="navbar-inner">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto text-center mr-xl-5">
                            <li class="nav-item mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link" href="welcome.jsp">Home&emsp;&emsp;

                                </a>
                            </li>


                            <li class="nav-item  mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link" href="cart.jsp">Cart&emsp;&emsp;

                                </a>
                            </li>
                            <li class="nav-item active mr-lg-2 mb-lg-0 mb-2">
                                <a class="nav-link" href="#">Transaction History&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- //navigation -->


        <!-- checkout page -->
        <div class="privacy py-sm-5 py-4">
            <div class="container py-xl-4 py-lg-2">
                <form action="PaidOrderController" method="post">
                    <!-- tittle heading -->
                    <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
                        <span>P</span>urchased <span>H</span>istory
                    </h3>
                    <!-- //tittle heading -->
                    <div class="checkout-right">
                        <h4 class="mb-sm-4 mb-3">Your have purchased:
                            <span>
                                <%
                                    try {

                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imbashop", "root", "");
                                        Statement st = con.createStatement();
                                        String strQuery = "SELECT COUNT(pname) FROM paid_orders WHERE user_email='" + user + "'";
                                        ResultSet rs = st.executeQuery(strQuery);
                                        String item_number = "";

                                        while (rs.next()) {
                                            item_number = rs.getString(1);
                                            if (item_number == null) {
                                                out.println("0");
                                            } else {
                                                out.println(item_number);
                                            }
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                                Products</span>
                        </h4>
                        <div class="table-responsive">
                            <table class="timetable_sub">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Total Price</th>
                                        <th>Delivery Status</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        PaidOrderDAO dao = new PaidOrderDAO();
                                        List<PaidOrder> orderList = dao.getAllPaidOrderByEmail(user);
                                        DecimalFormat df = new DecimalFormat("#0.00");
                                        for (PaidOrder o : orderList) {
                                    %>
                                    <tr class="rem1">
                                        <td class="invert"><%= o.getPname()%></td>
                                        <td class="invert"><%= o.getQuantity()%></td>
                                        <td class="invert">RM <%= o.getPrice() + "0"%></td>
                                        <%
                                            if (o.getStatus().equals("paid")) {
                                        %>
                                        <td class="invert"><font color="#E6B80F">In Process</font></td>
                                            <%
                                            } else {
                                            %>
                                        <td class="invert"><font color="green">Out For Delivery</font></td>
                                            <%
                                                }
                                            %>

                                        <%
                                            }
                                        %>
                                    </tr>

                                    <tr class="rem1">
                                        <td><h2>Status : </h2></td>
                                        <td colspan="4"><h2>PAID</h2></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- //checkout page -->

        <!-- middle section -->
        <div class="join-w3l1 py-sm-5 py-4">
            <div class="container py-xl-4 py-lg-2">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="join-agile text-left p-4">
                            <div class="row">
                                <div class="col-sm-7 offer-name">
                                    <h6>Smooth, Rich & Loud Audio</h6>
                                    <h4 class="mt-2 mb-3">Branded Headphones</h4>
                                    <p>Sale up to 25% off all in store</p>
                                </div>
                                <div class="col-sm-5 offerimg-w3l">
                                    <img src="images/off1.svg" alt="" class="img-fluid">
                                    <br><br>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-6 mt-lg-0 mt-5">
                        <div class="join-agile text-left p-4">
                            <div class="row ">
                                <div class="col-sm-7 offer-name">
                                    <h6>Gaming Laptop</h6>
                                    <h4 class="mt-2 mb-3">High Performance Laptop</h4>
                                    <p>Free shipping order over $100</p>
                                </div>
                                <div class="col-sm-5 offerimg-w3l">
                                    <img src="images/alien.svg" alt="" class="img-fluid">
                                    <br><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- middle section -->


        <!-- copyright -->
        <div class="copy-right py-3">
            <div class="container">
                <p class="text-center text-white">2019 IMBA Store.&copy;

                </p>
            </div>
        </div>
        <!-- //copyright -->

        <!-- js-files -->
        <!-- jquery -->
        <script src="js/jquery-2.2.3.min.js"></script>
        <!-- //jquery -->

        <!-- nav smooth scroll -->
        <script>
            $(document).ready(function() {
                $(".dropdown").hover(
                        function() {
                            $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                            $(this).toggleClass('open');
                        },
                        function() {
                            $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                            $(this).toggleClass('open');
                        }
                );
            });
        </script>
        <!-- //nav smooth scroll -->

        <!-- popup modal (for location)-->
        <script src="js/jquery.magnific-popup.js"></script>
        <script>
            $(document).ready(function() {
                $('.popup-with-zoom-anim').magnificPopup({
                    type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

            });
        </script>
        <!-- //popup modal (for location)-->

        <!-- cart-js -->
        <script src="js/minicart.js"></script>
        <script>
            paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

            paypals.minicarts.cart.on('checkout', function(evt) {
                var items = this.items(),
                        len = items.length,
                        total = 0,
                        i;

                // Count the number of each item in the cart
                for (i = 0; i < len; i++) {
                    total += items[i].get('quantity');
                }

                if (total < 1) {
                    alert('The minimum order quantity is 1. Please add more to your shopping cart before checking out');
                    evt.preventDefault();
                }
            });
        </script>
        <!-- //cart-js -->

        <!-- password-script -->
        <script>
            window.onload = function() {
                document.getElementById("password1").onchange = validatePassword;
                document.getElementById("password2").onchange = validatePassword;
            }

            function validatePassword() {
                var pass2 = document.getElementById("password2").value;
                var pass1 = document.getElementById("password1").value;
                if (pass1 != pass2)
                    document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("password2").setCustomValidity('');
                //empty string means no validation error
            }
        </script>
        <!-- //password-script -->

        <!-- quantity -->
        <script>
            $('.value-plus').on('click', function() {
                var divUpd = $(this).parent().find('.value'),
                        newVal = parseInt(divUpd.text(), 10) + 1;
                divUpd.text(newVal);
            });

            $('.value-minus').on('click', function() {
                var divUpd = $(this).parent().find('.value'),
                        newVal = parseInt(divUpd.text(), 10) - 1;
                if (newVal >= 1)
                    divUpd.text(newVal);
            });
        </script>
        <!--quantity-->
        <script>
            $(document).ready(function(c) {
                $('.close1').on('click', function(c) {
                    $('.rem1').fadeOut('slow', function(c) {
                        $('.rem1').remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function(c) {
                $('.close2').on('click', function(c) {
                    $('.rem2').fadeOut('slow', function(c) {
                        $('.rem2').remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function(c) {
                $('.close3').on('click', function(c) {
                    $('.rem3').fadeOut('slow', function(c) {
                        $('.rem3').remove();
                    });
                });
            });
        </script>
        <!-- //quantity -->

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

        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
        <!-- //js-files -->

    </body>

</html>
