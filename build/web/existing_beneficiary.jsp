<%-- 
    Document   : existing_beneficiary
    Created on : Jan 8, 2017, 6:09:44 PM
    Author     : caniksea
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hudatrans.caniksea.model.Beneficiary"%>
<%@page import="java.util.Set"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page import="com.hudatrans.caniksea.model.TransactionRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    User user = (User) session.getAttribute("user");
    double fee = 0, total = 0, destinationAmount = 0, sourceAmount = 0;
    String customerName = "", message = "";
    if (user != null) {
        customerName = user.getFirst_name();
        TransactionRequest tr = (TransactionRequest) session.getAttribute("TransactionRequest");
        message = "Welcome " + customerName;
        if (tr != null) {
            fee = tr.getFee();
            total = tr.getTotal();
            destinationAmount = tr.getDestination_amount();
            sourceAmount = tr.getSource_amount();
        }
        Set<Beneficiary> beneficiaries = (Set<Beneficiary>) session.getAttribute("beneficiaries");
    } else {
        response.sendRedirect("indizea");
    }
%>

<%@include file="WEB-INF/jspf/top-head.jspf" %>
<%@include file="WEB-INF/jspf/nav-header.jspf" %>

<div class="container">
    <div class="container_inner default_template_holder clearfix page_container_inner" >
        <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1475053735792" style=' text-align:left;'>
            <div class=" full_section_inner clearfix">
                <div class="wpb_column vc_column_container vc_col-sm-3">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper"></div>                            
                    </div>                        
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-6">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_raw_code wpb_content_element wpb_raw_html">
                                <div class="signup-box">
                                    <form action="pagbabayad" method="post">
                                        <div class="details-container">
                                            <div class="mta-widget-container">
                                                <div class="msg"><%= message%></div>
                                                <!--<div class="top-container">-->
                                                <div class="destination-country-container">
                                                    <label for="beneficiary">Select Beneficiary</label>
                                                    <select class="delivery-method-select custom-select" name="beneficiary" required="required" id="beneficiary">
                                                        <option value="" label="Select...">Select...</option>
                                                        <c:forEach var="beneficiary" items="${beneficiaries}">
                                                            <option value="${beneficiary.beneficiary_id}">${beneficiary.first_name}  ${beneficiary.middle_name} ${beneficiary.last_name} - ${beneficiary.account_number}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <!--</div>-->
                                                <div class="alert alert-success" role="alert" id="beneficiary_info">
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-6 tnx_info">Country:</div>
                                                        <div class="col-md-8 col-sm-6 beneficiary_bank_info" id="beneficiary_info_country"></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-6 tnx_info">Bank:</div>
                                                        <div class="col-md-8 col-sm-6 beneficiary_bank_info" id="beneficiary_info_bank"></div>
                                                    </div>
                                                </div>

                                                <div class="alert alert-info" role="alert">
                                                    <div class="row">
                                                        <div class="col-md-8 col-sm-6 col-xs-12 tnx_info">Recipient gets:</div>
                                                        <div class="col-md-4 col-sm-6 col-xs-12 tnx_money"><%= destinationAmount%></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8 col-sm-6 tnx_info">Sending Amount:</div>
                                                        <div class="col-md-4 col-sm-6 tnx_money"><%= sourceAmount%></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8 col-sm-6 tnx_info">Fee:</div>
                                                        <div class="col-md-4 col-sm-6 tnx_money"><%= fee%></div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-8 col-sm-8 tnx_info">Total Amount:</div>
                                                        <div class="col-md-4 col-sm-6 tnx_money"><%= total%></div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn button-submit" >Send Money</button>
                                                <a href="fi_beneficiario">New Beneficiary? Click to add.</a>
                                                <div class="spacer-or"></div>
                                                <a href ="cancelTxn.jsp" class="cancel-link cancel-payment">Cancel Payment</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>                            
                    </div>                        
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-3">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper"></div>                            
                    </div>                        
                </div>
            </div>                
        </div>
    </div>
</div>

<%@include file="WEB-INF/jspf/bottom-end.jspf" %>

