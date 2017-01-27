<%-- 
    Document   : sm-mgt
    Created on : Jan 27, 2017, 2:19:06 PM
    Author     : caniksea
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Initiate Transaction";
    String customerName = "", customerFirstName = "", message = "";

    User user = (User) session.getAttribute("user");
    if (user != null) {
        RPEngine engine = new RPEngine();
        customerFirstName = user.getFirst_name();
        customerName = user.getFirst_name() + " " + user.getLast_name();

    } else {
        response.sendRedirect("indizea");
    }
%>
<%@include file="WEB-INF/jspf/mgt_header.jspf" %>
<%@include file="WEB-INF/jspf/mgt_nav.jspf" %>

<aside class="right-side">    
    <!-- Main content -->
    <section class="content">
        <!-- Main row -->
        <div class="row">
            <div class="col-md-8">
                <section class="panel">
                    <header class="panel-heading">
                        Intiate Payment
                    </header>
                    <div class="panel-body">

                        <div class="row">

                            <div class="col-md-10 col-sm-10 col-xs-10 form-group">
                                <select id="bg_country" name="destination_country_code" class="form-control" required>
                                    <option value="" >Select Beneficiary</option>
                                    <c:forEach var="beneficiary" items="${beneficiaries}">
                                        <option value="${beneficiary.beneficiary_id}">${beneficiary.first_name}  ${beneficiary.middle_name} ${beneficiary.last_name} - ${beneficiary.account_number}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-2 col-sm-2 col-xs-2 form-group">
                                <img style="float: right; height: 30px;" id="countryFlag" src="http://localhost:8080/hudatrans/wp-content/country_flags/United-Kingdom-small.jpg" alt="" />
                            </div>

                            <div class="col-md-12 form-group">
                                <select id="bg_country" name="destination_country_code" class="form-control" required>
                                    <option value="">Select Payment Method</option>
                                </select>
                            </div>


                            <div class="col-md-6 form-group">
                                <span class="input-group-addon">POUNDS</span>
                                <input type="text" class="form-control" placeholder="Sending Amount">
                            </div>

                            <div class="col-md-6 form-group">
                                <span class="input-group-addon">POUNDS</span>
                                <input type="text" class="form-control" disabled placeholder="Receiving Amount">
                            </div>

                            <!--                            <div class="col-md-4 form-group">
                                                            <span class="input-group-addon">POUNDS</span>
                                                            <input type="text" class="form-control" disabled placeholder="Username">
                                                        </div>-->

                            <div class="col-md-6 col-xs-6 form-group">
                                <button type="submit" class="btn btn-info">Send Money</button>
                            </div>

                            <div class="col-md-6 form-group">
                                <button type="reset" class="btn btn-danger" style="float: right;">clear</button>
                            </div>
                        </div>

                    </div>
                </section>
            </div>
            <div class="col-md-4">
                <section class="panel">
                    <header class="panel-heading">
                        Transaction Details
                    </header>
                    <div class="panel-body">
                        <div class="alert alert-info">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Destination Country: </strong> <b style="float: right; padding-right: 10px;">United Kingdom</b>
                        </div>
                        <div class="alert alert-block alert-info">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Transaction Fee: </strong> <b style="float: right; padding-right: 10px;">0.0</b>
                        </div>
                        <div class="alert alert-success">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Total: </strong> <b style="float: right; padding-right: 10px;">500.87</b>
                        </div>
                    </div>
                </section>
            </div>
        </div>        
    </section>
</aside>

<%@include file="WEB-INF/jspf/mgt_footer.jspf" %>
