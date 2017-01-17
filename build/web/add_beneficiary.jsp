<%-- 
    Document   : add_beneficiary
    Created on : Jan 14, 2017, 10:53:15 AM
    Author     : caniksea
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    String customerName = "", message = "";
    if (user != null) {
        customerName = user.getFirst_name();
        message = "Add Beneficiary for " + customerName;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/top-head.jspf" %>
<%@include file="WEB-INF/jspf/nav-header.jspf" %>


<div class="container">
    <jsp:useBean id="loader" scope="request" class="com.hudatrans.caniksea.bean.Loader" />
    <div class="container_inner default_template_holder clearfix page_container_inner" >
        <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1468974159274" style=' text-align:left;'>
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
                                <div class="wpb_wrapper">
                                    <div class="signup-box">
                                        <div class="details-container">
                                            <form method="POST" action="tinyeuru" >
                                                <div class="msg"><%= message%></div>
                                                <div >
                                                    <div class="input-container">
                                                        <input required placeholder="First Name" type="text" name="beneficiary_firstname"/>
                                                        <span class="required-label">required</span>
                                                    </div>
                                                    <div class="input-container">
                                                        <input required placeholder="Last Name" type="text"  name="beneficiary_lastname"/>
                                                        <span class="required-label">required</span>
                                                    </div>
                                                    <div class="input-container">
                                                        <select class="delivery-method-select beneficiary_selection" placeholder="Country" required="required" id="beneficiary_country" name="beneficiary_country">
                                                            <option value="" label="Select Country...">Select Country...</option>
                                                            <c:forEach var="country" items="${loader.countries}">
                                                                <option value="${country.country_iso_code}">${country.country_name}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <span class="required-label">required</span>
                                                    </div>
                                                    <div class="input-container">
                                                        <select class="delivery-method-select beneficiary_selection" required id="beneficiary_bank" name="beneficiary_bank">
                                                            <option value="" label="Select Bank...">Select Bank...</option>
                                                        </select>
                                                        <span class="required-label">required</span>
                                                    </div>
                                                    <div class="input-container">
                                                        <input required placeholder="Account Number" type="number" name="beneficiary_acc_number"/>
                                                        <span class="required-label">required</span>
                                                    </div>
                                                    <button type="submit" class="btn button-submit">Add Beneficiary</button>
                                                    <a href ="select_beneficiary" class="cancel-link">return to Existing Beneficiaries</a>
                                                    <div class="spacer-or"></div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="container"></div>
                                    </div>
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
