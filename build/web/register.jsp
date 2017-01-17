<%-- 
    Document   : register
    Created on : Jan 8, 2017, 4:27:16 PM
    Author     : caniksea
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String error = (String) session.getAttribute("error");
    String source = request.getParameter("sp") == null ? request.getParameter("source") : request.getParameter("sp");
    source = source == null ? "" : source;
    String errorMsg = "";
    String css_style = "msg";
    boolean showMsg = false;
    if (!source.equals("l")) {
        if (error != null && !error.isEmpty()) {
            showMsg = true;
            errorMsg = error;
            css_style += " msg-error";
        }
    }
%>

<%@include file="WEB-INF/jspf/top-head.jspf" %>
<%@include file="WEB-INF/jspf/nav-header.jspf" %>

<div class="container" id="register_frag">
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
                                <div class="signup-box">
                                    <form id="register-form" action="handle_registration" method="post">
                                        <div class="details-container">
                                            <% if (showMsg) {%>                                                
                                            <div class="<%= css_style%>"><%= errorMsg%></div>
                                            <% }%>
                                            <div class="input-container">
                                                <input required id="r_customer_firstname" name="r_customer_firstname" placeholder="First name" type="text" />
                                                <span class="required-label">required</span>
                                            </div>
                                            <div class="input-container">
                                                <input required name="r_customer_lastname" id="r_customer_lastname" placeholder="Last name" type="text" />
                                                <span class="required-label">required</span>
                                            </div>
                                            <div class="input-container">
                                                <input required id="r_customer_email" placeholder="Email" type="email" name="r_customer_email"/>
                                                <span class="required-label">required</span>
                                            </div>
                                            <div class="input-container" style="padding: 0 0 60px 0;">
                                                <input required id="r_password" class="passcode col-sm-8" style="width: 90%;" placeholder="Password" type="password" name="r_password"/>
                                                <span class="input-group-btn col-sm-4">
                                                    <button id="togglePass" class="btn btn-default revealpasscode pass-img" style="height: 49px;" type="button"><i class="glyphicon glyphicon-eye-open"></i></button>
                                                </span> 
                                            </div>
                                            <button type="submit" class="btn button-submit" >Create account</button>
                                            <a href="identifier?sp=r">Already have an account? Return to login page.</a>
                                            <div class="spacer-or"></div>
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

