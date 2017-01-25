<%-- 
    Document   : dashboard
    Created on : Jan 23, 2017, 5:07:18 PM
    Author     : caniksea
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.hudatrans.caniksea.model.Beneficiary"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hudatrans.caniksea.model.Sale"%>
<%@page import="java.util.Set"%>
<%@page import="com.hudatrans.caniksea.model.GenericCollectionResponse"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String successMessage = "", errorMessage = "";
    boolean showSuccess = false, showError = false;
    User user = (User) session.getAttribute("user");
    String customerName = "", customerFirstName = "";
    String pageTitle = "";
    int noOfPendingTransaction = 0, noOfTransactions = 0;
    JsonArray pendingT = null, allT = null, beneficiaries = null;
    Set<Object> beneficiarySet = new HashSet<>();
    if (user != null) {
        RPEngine engine = new RPEngine();
        customerFirstName = user.getFirst_name();
        customerName = user.getFirst_name() + " " + user.getLast_name();
        pageTitle = customerFirstName + "'s Dashboard";

        successMessage = (String) session.getAttribute("success");
        if (successMessage != null && !successMessage.isEmpty()) {
            showSuccess = true;
        }

        errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null && !errorMessage.isEmpty()) {
            showError = true;
        }

        //get pending transactions
        GenericCollectionResponse gcr = engine.getTransactions(user.getContact_id(), "PENDING");
        if (gcr.getResponse_code().equals("00")) {
            if (!gcr.getResponse_data().isEmpty()) {
                pendingT = engine.getPendingTransactionsFromJson(gcr.getResponse_data());
                noOfPendingTransaction = pendingT.size();
            }
        }

        //get all transactions
        GenericCollectionResponse allTransactions = engine.getTransactions(user.getContact_id(), "ALL");
        if (allTransactions.getResponse_code().equals("00")) {
            if (!allTransactions.getResponse_data().isEmpty()) {
                allT = engine.getAllTransactionsFromJson(allTransactions.getResponse_data());
                noOfTransactions = allT.size();
            }
        }

        //get beneficiaries
        beneficiarySet = (Set<Object>) session.getAttribute("beneficiaries");
        if (beneficiarySet == null) {
            GenericCollectionResponse gcr_ben = engine.getBeneficiaries(user);
            if (gcr_ben.getResponse_code().equals("00")) {
                session.setAttribute("beneficiaries", gcr_ben.getResponse_data());
                beneficiarySet = (Set<Object>) gcr_ben.getResponse_data();
            }
        }
        beneficiaries = engine.getBenFromJson(beneficiarySet);

    } else {
        response.sendRedirect("indizea");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <title><%= pageTitle%></title>
        <!-- bootstrap 3.0.2 -->
        <link href="wp-content/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="wp-content/assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="wp-content/assets/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="wp-content/assets/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="wp-content/assets/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="wp-content/assets/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="wp-content/assets/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="wp-content/assets/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="wp-content/assets/css/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="indizea" class="logo">
                <img id="logoImage" src="wp-content/uploads/2016/07/logo-beta.png">
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span><%= customerName%> <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>

                                <li>
                                    <a href="#">
                                        <i class="fa fa-clock-o fa-fw pull-right"></i>
                                        <span class="badge badge-success pull-right">10</span> Updates</a>
                                    <a href="#">
                                        <i class="fa fa-envelope-o fa-fw pull-right"></i>
                                        <span class="badge badge-danger pull-right">5</span> Messages</a>
                                    <a href="#"><i class="fa fa-magnet fa-fw pull-right"></i>
                                        <span class="badge badge-info pull-right">3</span> Subscriptions</a>
                                    <a href="#"><i class="fa fa-question fa-fw pull-right"></i> <span class=
                                                                                                      "badge pull-right">11</span> FAQ</a>
                                </li>

                                <li class="divider"></li>

                                <li>
                                    <a href="#">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                        Profile
                                    </a>
                                    <a data-toggle="modal" href="#modal-user-settings">
                                        <i class="fa fa-cog fa-fw pull-right"></i>
                                        Settings
                                    </a>
                                </li>

                                <li class="divider"></li>

                                <li>
                                    <a href="phuma"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left info">
                            <p>Hello, <%= customerFirstName%></p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="index.html">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="general.html">
                                <i class="fa fa-gavel"></i> <span>General</span>
                            </a>
                        </li>

                        <li>
                            <a href="basic_form.html">
                                <i class="fa fa-globe"></i> <span>Basic Elements</span>
                            </a>
                        </li>

                        <li>
                            <a href="simple.html">
                                <i class="fa fa-glass"></i> <span>Simple tables</span>
                            </a>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <aside class="right-side">
                <!-- Main content -->
                <section class="content">
                    <div class="row" style="margin-bottom:5px;">
                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-th-list"></i></span>
                                <div class="sm-st-info">
                                    <span><%= noOfTransactions%></span>
                                    Total Transactions
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-green"><i class="fa fa-check-square-o"></i></span>
                                <div class="sm-st-info">
                                    <span>2200</span>
                                    Successful Transactions
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-red"><i class="fa fa-stop"></i></span>
                                <div class="sm-st-info">
                                    <span>100,320</span>
                                    Failed Transactions
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Main row -->
                    <div class="row">
                        <div class="col-md-8">
                            <section class="panel">
                                <header class="panel-heading">
                                    Pending Transactions (9)
                                </header>
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Transaction Date</th>
                                                <th>Beneficiary</th>
                                                <th class="amount-align">Order Amount</th>
                                                <th class="amount-align">Beneficiary Amount</th>
                                                <!--<th>Status</th>-->
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                if (noOfPendingTransaction > 0) {
                                                    int upperBound = pendingT.size() > 9 ? 9 : pendingT.size();
                                                    for (int i = 0; i < upperBound; i++) {
                                                        JsonObject o = (JsonObject) pendingT.get(i);
                                                        String currency = o.get("currency").getAsString();
                                                        String benId = o.get("beneficiary_id").getAsString();
                                                        if (currency.equalsIgnoreCase("Naira")) {
                                                            currency = "&#8358;";
                                                        } else if (currency.equalsIgnoreCase("Cedis")) {
                                                            currency = "&#8373;";
                                                        } else if (currency.equalsIgnoreCase("Rand")) {
                                                            currency = "ZAR";
                                                        } else if (currency.equalsIgnoreCase("Pounds")) {
                                                            currency = "&pound;";
                                                        }
                                                        //get beneficiary name
                                                        String name = "";
                                                        if (beneficiaries != null) {
                                                            for (int j = 0; j < beneficiaries.size(); j++) {
                                                                JsonObject p = (JsonObject) beneficiaries.get(j);
                                                                double idDbl = p.get("beneficiary_id").getAsDouble();
                                                                int id = (int) idDbl;
                                                                String idStr = String.valueOf(id);
                                                                if (idStr.equals(benId)) {
                                                                    name = p.get("first_name").getAsString() + " " + p.get("last_name").getAsString();
                                                                    break;
                                                                }
                                                            }
                                                        }
                                            %>
                                            <tr>
                                                <td><%= o.get("order_date").getAsString()%></td>
                                                <td><%= name%></td>
                                                <td class="amount-align">&pound; <%= o.get("sending_amount").getAsString()%></td>
                                                <td class="amount-align"><%= currency%> <%= o.get("receiving_amount").getAsString()%></td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>


                                        </tbody>
                                    </table>
                                </div>
                            </section>
                        </div>
                        <div class="col-lg-4">
                            <section class="panel">
                                <header class="panel-heading">
                                    Notifications
                                </header>
                                <div class="panel-body" id="noti-box">
                                    <% if (!showSuccess && !showError) { %>
                                    <div class="alert alert-info">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>All good!</strong> You have no recent notification.
                                    </div>
                                    <% } else if (showError) { %>
                                    <div class="alert alert-block alert-danger">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Oh snap!</strong> Your last transaction was not successful.
                                    </div>
                                    <% } else if (showSuccess) { %>
                                    <div class="alert alert-success">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>Well done!</strong> Your last transaction was successful.
                                    </div>
                                    <% }%>
                                    <div class="alert alert-warning">
                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                            <i class="fa fa-times"></i>
                                        </button>
                                        <strong>**</strong> You have <%= noOfPendingTransaction%> pending transactions.
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Last Five (5) Transactions
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <tr>
                                            <th>Transaction Date</th>
                                            <th>Beneficiary</th>
                                            <th class="amount-align">Order Amount</th>
                                            <th class="amount-align">Order Amount</th>
                                            <th>Status</th>
                                        </tr>
                                        <%
                                            if (noOfTransactions > 0) {
                                                int upperBound = allT.size() > 5 ? 5 : allT.size();
                                                for (int i = 0; i < upperBound; i++) {
                                                    JsonObject o = (JsonObject) pendingT.get(i);
                                                    String benId = o.get("beneficiary_id").getAsString();
                                                    String currency = o.get("currency").getAsString();
                                                    if (currency.equalsIgnoreCase("Naira")) {
                                                        currency = "&#8358;";
                                                    } else if (currency.equalsIgnoreCase("Cedis")) {
                                                        currency = "&#8373;";
                                                    } else if (currency.equalsIgnoreCase("Rand")) {
                                                        currency = "ZAR";
                                                    } else if (currency.equalsIgnoreCase("Pounds")) {
                                                        currency = "&pound;";
                                                    }
                                                    String statusStyle = "label-success", status = o.get("status").getAsString();
                                                    if (status.equalsIgnoreCase("PENDING")) {
                                                        statusStyle = "label-warning";
                                                    } else if (status.equalsIgnoreCase("Failed")) {
                                                        statusStyle = "label-danger";
                                                    }
                                                    //get beneficiary name
                                                    String name = "";
                                                    if (beneficiaries != null) {
                                                        for (int j = 0; j < beneficiaries.size(); j++) {
                                                            JsonObject p = (JsonObject) beneficiaries.get(j);
                                                            double idDbl = p.get("beneficiary_id").getAsDouble();
                                                            int id = (int) idDbl;
                                                            String idStr = String.valueOf(id);
                                                            if (idStr.equals(benId)) {
                                                                name = p.get("first_name").getAsString() + " " + p.get("last_name").getAsString();
                                                                break;
                                                            }
                                                        }
                                                    }
                                        %>
                                        <tr>
                                            <td><%= o.get("order_date").getAsString()%></td>
                                            <td><%= name%></td>
                                            <td class="amount-align">&pound; <%= o.get("sending_amount").getAsString()%></td>
                                            <td class="amount-align"><%= currency%> <%= o.get("receiving_amount").getAsString()%></td>
                                            <td><span class="label <%= statusStyle%>"><%= status%></span></td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
                    <!-- row end -->
                </section><!-- /.content -->
                <div class="footer-main">
                    &copy; 2016 hudatransfer.com All rights
                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->
        <!-- jQuery 2.0.2 -->
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>-->
        <script src="wp-content/assets/js/jquery.min.js" type="text/javascript"></script>

        <!-- jQuery UI 1.10.3 -->
        <script src="wp-content/assets/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="wp-content/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="wp-content/assets/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

        <script src="wp-content/assets/js/plugins/chart.js" type="text/javascript"></script>

        <!-- datepicker
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
        <!-- Bootstrap WYSIHTML5
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
        <!-- iCheck -->
        <script src="wp-content/assets/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="wp-content/assets/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

        <!-- Director App -->
        <script src="wp-content/assets/js/Director/app.js" type="text/javascript"></script>

        <!-- Director dashboard demo (This is only for demo purposes) -->
        <script src="wp-content/assets/js/Director/dashboard.js" type="text/javascript"></script>
        <!-- Director for demo purposes -->
        <script type="text/javascript">
            $('input').on('ifChecked', function (event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().addClass('highlight');
                $(this).parents('li').addClass("task-done");
                console.log('ok');
            });
            $('input').on('ifUnchecked', function (event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().removeClass('highlight');
                $(this).parents('li').removeClass("task-done");
                console.log('not');
            });

        </script>
        <script>
            $('#noti-box').slimScroll({
                height: '400px',
                size: '5px',
                BorderRadius: '5px'
            });

            $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
                checkboxClass: 'icheckbox_flat-grey',
                radioClass: 'iradio_flat-grey'
            });
        </script>
        <!--        <script type="text/javascript">
                    $(function () {
                        "use strict";
                        //BAR CHART
                        var data = {
                            labels: ["January", "February", "March", "April", "May", "June", "July"],
                            datasets: [
                                {
                                    label: "My First dataset",
                                    fillColor: "rgba(220,220,220,0.2)",
                                    strokeColor: "rgba(220,220,220,1)",
                                    pointColor: "rgba(220,220,220,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data: [65, 59, 80, 81, 56, 55, 40]
                                },
                                {
                                    label: "My Second dataset",
                                    fillColor: "rgba(151,187,205,0.2)",
                                    strokeColor: "rgba(151,187,205,1)",
                                    pointColor: "rgba(151,187,205,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(151,187,205,1)",
                                    data: [28, 48, 40, 19, 86, 27, 90]
                                }
                            ]
                        };
                        new Chart(document.getElementById("linechart").getContext("2d")).Line(data, {
                            responsive: true,
                            maintainAspectRatio: false,
                        });
        
                    });
                    // Chart.defaults.global.responsive = true;
                </script>-->

    </body>
</html>
