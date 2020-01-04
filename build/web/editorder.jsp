<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="DataAccessor.ProductDAO"%>
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
            if(session.getAttribute("user_email")==null) {
        %>
            <jsp:include page="index.jsp"></jsp:include>
        <%
            }
        %>
        <div class="page-wrapper">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop3 d-none d-lg-block">
                <div class="section__content section__content--p35">
                    <div class="header3-wrap">
                        <div class="header__logo">
                            <a href="welcome.jsp"><h3>Imba Shop</h3></a>
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
                                        <a href="#">
                                            <i class="zmdi zmdi-settings"></i>Setting</a>
                                    </div>
                                    <div class="account-dropdown__item">
                                        <a href="#">
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



                <div class="modal-header">
                    <h5 class="modal-title">Edit Items</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body col-lg-6">
                    <form action="UpdateCartController" method="post" >
                        <div class="form-group">
                            <input type="hidden" class="form-control" name="id" value="${product.getId()}" />
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Name</label>
                            <input type="text" class="form-control" placeholder=" "  value="${product.getPname()}" name="pname"  required="" readonly>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Quantity</label>
                            <input type="number" class="form-control" placeholder=" "  value="${product.getQuantity()}" name="quantity"  required="">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Price</label>
                            <input type="number" class="form-control" placeholder=" "  value="${product.getPrice()}" name="price" required="" readonly>
                        </div>
                        <div class="right-w3l">
                            <input type="submit" class="form-control" value="Submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Add item modal-data -->
    <section class="p-t-60 p-b-20">


    </div>

    <!-- copyright -->
    <div class="copy-right py-3">
        <div class="container">
            <p class="text-center text-white">© 2019 IMBA Store.

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

<!--client side delete-->
<script>
    $(document).ready(function(c) {
        $('.del1').on('click', function(c) {
            $('.tr-shadow1').fadeOut('slow', function(c) {
                $('.tr-shadow1').remove();
            });
        });
    });
</script>
<script>
    $(document).ready(function(c) {
        $('.del2').on('click', function(c) {
            $('.tr-shadow2').fadeOut('slow', function(c) {
                $('.tr-shadow2').remove();
            });
        });
    });
</script>

<script>
    $(document).ready(function(c) {
        $('.del3').on('click', function(c) {
            $('.tr-shadow3').fadeOut('slow', function(c) {
                $('.tr-shadow3').remove();
            });
        });
    });
</script>
<script>
    $(document).ready(function(c) {
        $('.del4').on('click', function(c) {
            $('.tr-shadow4').fadeOut('slow', function(c) {
                $('.tr-shadow4').remove();
            });
        });
    });
</script>
<!-- //end client side delete -->



</body>

</html>
<!-- end document-->
