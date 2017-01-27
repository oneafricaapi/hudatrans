<%-- 
    Document   : index
    Created on : Jan 6, 2017, 8:52:03 AM
    Author     : caniksea
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/top-head.jspf" %>
<%@include file="WEB-INF/jspf/nav-header.jspf" %>

<%
    String currentPage = "home";
%>

<script>
    var page_scroll_amount_for_sticky = 650;
</script>
<div class="full_width" id="home_frag">
    <jsp:useBean id="loader" scope="session" class="com.hudatrans.caniksea.bean.Loader" />
    <div class="full_width_inner" >
        <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1475053735792 pb1">
            <div class=" full_section_inner clearfix">
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_text_column wpb_content_element ">
                                <div class="wpb_wrapper">
                                    <p style="text-align: center; font-size: 30px; line-height: 30px; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 0.05em;"><span style="color: #ffffff;"></span></p>
                                    <p style="text-align: center; font-size: 14px; font-weight: 500; color: #ffffff;"></p>
                                </div> 
                            </div>
                            <div class="wpb_raw_code wpb_content_element wpb_raw_html">
                                <div class="wpb_wrapper">
                                    <form method="post" action="identifier">
                                        <input type="hidden" name="merchant_code" id="merchant_code" value="RPSU" />
                                        <input type="hidden" name="sp" value="<%= currentPage %>" />
                                        <div class="mta-widget-container">
                                            <div id="msg-general" class="msg"></div>
                                            <div class="top-container">
                                                <div class="destination-country-container row">
                                                    <label for="destination-countries">Destination country</label>
                                                    <div class="flag-container col-md-8">
                                                        <!-- original widget -->
                                                        <select class="delivery-method-select" name="destination_country_code" required="required" id="destination-countries">
                                                            <option value="" label="Select...">Select...</option>
                                                            <c:forEach var="country" items="${loader.countries}">
                                                                <option value="${country.country_iso_code}">${country.country_name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="flag-container col-md-4">
                                                        <!-- original widget -->
                                                        <img id="countryFlag" src="" alt="" height="42" />
                                                    </div>
                                                </div>
                                                <div class="delivery-method-container" id="method-container">
                                                    <label for="delivery-method">Choose method</label>
                                                    <div class="select-container">
                                                        <select class="delivery-method-select" name="pay_method" required id="delivery-method">
                                                            <option value="" label="Select...">Select...</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="msg-widget" class="msg"></div>
                                            <div class="widget-container" id="exchange-container">
                                                <div class="widget">
                                                    <label for="send-amount">You're sending</label>
                                                    <div class="widget-top">
                                                        <input maxlength="12" placeholder="0.00" class="input-top" type="text" id="sending-amount" name="source_amount">
                                                        <select class="select-top" id="sending-currency">
                                                            <option value="">POUNDS</option>
                                                        </select>
                                                        <span class="chevron"></span>
                                                    </div>
                                                    <label for="receiving-amount">Recipient gets</label>
                                                    <div class="widget-bottom">
                                                        <input maxlength="12" placeholder="0.00" class="input-bottom" id="receiving-amount" type="text">
                                                        <select class="select-bottom" id="receiving-currency" >
                                                        </select>
                                                        <span class="chevron"></span>
                                                    </div>
                                                    <div class="transaction-info row" id="transaction-info-div">
                                                        <div class="col-md-6">
                                                            <label for="transaction-fee">Transaction Fee</label>
                                                            <input class="input-top transaction-info-details" type="text" readonly id="transaction-fee">
                                                        </div>
                                                        <div class="flag-container col-md-6">
                                                            <label for="transaction-total">Total</label>
                                                            <input class="input-top transaction-info-details" type="text" readonly id="transaction-total">
                                                        </div>
                                                        <button type="submit" class="btn btn-success" style="width: 100%;">SEND MONEY</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1468402410063 grid_section" style=' text-align:left;'>
        <div class=" section_inner clearfix">
            <div class='section_inner_margin clearfix'>
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_text_column wpb_content_element ">
                                <div class="wpb_wrapper">
                                    <h4 style="text-align: center; text-transform: uppercase; letter-spacing: 0.2em; font-weight: 500; font-size: 25px;">
                                        <span style="color: #1f9fb4;">It&#8217;s never been so easy</span>
                                    </h4>
                                </div> 
                            </div>
                            <div class="vc_row wpb_row section vc_row-fluid vc_inner  vc_custom_1468402429061" style=' text-align:left;'>
                                <div class=" full_section_inner clearfix">
                                    <div class="wpb_column vc_column_container vc_col-sm-4">
                                        <div class="vc_column-inner vc_custom_1468402683819">
                                            <div class="wpb_wrapper">
                                                <div class="wpb_single_image wpb_content_element vc_align_center">
                                                    <div class="wpb_wrapper">
                                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                            <img class="vc_single_image-img " src="wp-content/uploads/2014/04/user-check-90x90.png" width="90" height="90" alt="user-check" title="user-check" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="wpb_text_column wpb_content_element ">
                                                    <div class="wpb_wrapper">
                                                        <h3 style="text-align: center; text-transform: uppercase; margin-top: 20px; margin-bottom: 20px; color: #222; font-size: 14px; letter-spacing: 0.1em;"><strong>Select Recipient</strong></h3>
                                                        <p style="text-align: center; font-size: 15px;">Pick the country and details of the recipient</p>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="wpb_column vc_column_container vc_col-sm-4">
                                        <div class="vc_column-inner vc_custom_1468402635501">
                                            <div class="wpb_wrapper">
                                                <div class="wpb_single_image wpb_content_element vc_align_center">
                                                    <div class="wpb_wrapper">
                                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                            <img class="vc_single_image-img " src="wp-content/uploads/2014/04/money-bag1-90x90.png" width="90" height="90" alt="money-bag1" title="money-bag1" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="wpb_text_column wpb_content_element ">
                                                    <div class="wpb_wrapper">
                                                        <h3 style="text-align: center; text-transform: uppercase; margin-top: 20px; margin-bottom: 20px; color: #222; font-size: 14px; letter-spacing: 0.1em;"><strong>Choose amount</strong></h3>
                                                        <p style="text-align: center; font-size: 15px;">Pick the amount to send.<br />
                                                            We tell you exactly what the fees are</p>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="wpb_column vc_column_container vc_col-sm-4">
                                        <div class="vc_column-inner vc_custom_1468402659027">
                                            <div class="wpb_wrapper">
                                                <div class="wpb_single_image wpb_content_element vc_align_center">
                                                    <div class="wpb_wrapper">
                                                        <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                            <img class="vc_single_image-img " src="wp-content/uploads/2014/04/approval-90x90.png" width="90" height="90" alt="approval" title="approval" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="wpb_text_column wpb_content_element ">
                                                    <div class="wpb_wrapper">
                                                        <h3 style="text-align: center; text-transform: uppercase; margin-top: 20px; margin-bottom: 20px; color: #222; font-size: 14px; letter-spacing: 0.1em;"><strong>Send Money</strong></h3>
                                                        <p style="text-align: center; font-size: 15px;">Click send and the money is on its way</p>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>             
    </div>

    <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1468409886994 grid_section" style=' text-align:left;'>
        <div class=" section_inner clearfix">
            <div class='section_inner_margin clearfix'>
                <div class="wpb_column vc_column_container vc_col-sm-2">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">

                        </div>
                    </div>
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-8">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_text_column wpb_content_element ">
                                <div class="wpb_wrapper">
                                    <p style="text-align: center; font-size: 27px; line-height: 31px;"><span style="color: #212121;"><strong>Built from the ground up for peace of mind</strong></span></p>
                                    <p style="text-align: center; color: #999999; font-size: 17px; margin-top: 9px; letter-spacing: 0.05em;"><strong>We know how important that money you are sending is to someone. That is why we have invested in speed and security to make sure it gets there safely and quickly.</strong></p>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>                                            
                <div class="wpb_column vc_column_container vc_col-sm-2">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">                                                                            
                        </div>
                    </div>
                </div>
            </div>
        </div>                   
    </div>

    <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1468405165222 grid_section" style=' text-align:left;'>
        <div class=" section_inner clearfix">
            <div class='section_inner_margin clearfix'>
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_text_column wpb_content_element ">
                                <div class="wpb_wrapper">
                                    <p style="text-align: center; text-transform: uppercase; font-size: 22px; letter-spacing: 0.1em;"><span style="color: #ffffff;">Why Choose Huda Transfer</span></p>
                                </div> 
                            </div>
                            <div  class="vc_row wpb_row section vc_row-fluid vc_inner  vc_custom_1468405522494 grid_section" style=' text-align:left;'>
                                <div class=" section_inner clearfix">
                                    <div class='section_inner_margin clearfix'>
                                        <div class="wpb_column vc_column_container vc_col-sm-4">
                                            <div class="vc_column-inner ">
                                                <div class="wpb_wrapper">
                                                    <div class="wpb_single_image wpb_content_element vc_align_center">
                                                        <div class="wpb_wrapper">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img class="vc_single_image-img " src="wp-content/uploads/2014/04/secure-75x75.png" width="75" height="75" alt="secure" title="secure" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="wpb_text_column wpb_content_element ">
                                                        <div class="wpb_wrapper">
                                                            <p style="text-align: center; font-size: 22px; margin-top: 17px; margin-bottom: 17px;"><span style="color: #ffffff;"><strong>Secure Payments</strong></span></p>
                                                            <p style="text-align: center; font-size: 16px;"><span style="color: #ffffff;">Most transfer companies use third party software to end their money. We built ours from the ground up so that we know your money is in safe hands.</span></p>
                                                        </div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wpb_column vc_column_container vc_col-sm-4">
                                            <div class="vc_column-inner ">
                                                <div class="wpb_wrapper">
                                                    <div class="wpb_single_image wpb_content_element vc_align_center">
                                                        <div class="wpb_wrapper">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img class="vc_single_image-img " src="wp-content/uploads/2014/04/envelope-75x75.png" width="75" height="75" alt="envelope" title="envelope" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="wpb_text_column wpb_content_element ">
                                                        <div class="wpb_wrapper">
                                                            <p style="text-align: center; font-size: 22px; margin-top: 17px; margin-bottom: 17px;"><span style="color: #ffffff;"><strong>Fast Delivery</strong></span></p>
                                                            <p style="text-align: center; font-size: 16px;"><span style="color: #ffffff;">Because of our own transfer software we can be one of the fastest money transfer options in the world.</span></p>
                                                        </div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wpb_column vc_column_container vc_col-sm-4">
                                            <div class="vc_column-inner "><div class="wpb_wrapper">
                                                    <div class="wpb_single_image wpb_content_element vc_align_center">
                                                        <div class="wpb_wrapper">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img class="vc_single_image-img " src="wp-content/uploads/2014/04/star-75x75.png" width="75" height="75" alt="star" title="star" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="wpb_text_column wpb_content_element ">
                                                        <div class="wpb_wrapper">
                                                            <p style="text-align: center; font-size: 22px; margin-top: 17px; margin-bottom: 17px;"><span style="color: #ffffff;"><strong>We Beat the Banks</strong></span></p>
                                                            <p style="text-align: center; font-size: 16px;"><span style="color: #ffffff;">Because of our own custom transfer software. We can beat banks and most other transfer companies.</span></p>
                                                        </div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="vc_row wpb_row section vc_row-fluid  custom_testimonial vc_custom_1468414265206 grid_section" style=' text-align:left;'>
        <div class=" section_inner clearfix">
            <div class='section_inner_margin clearfix'>
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_text_column wpb_content_element  vc_custom_1468412942549">
                                <div class="wpb_wrapper">
                                    <h4 style="text-align: center; text-transform: uppercase; letter-spacing: 0.2em; font-weight: 500; font-size: 25px;"><span style="color: #1f9fb4;">What our customers are saying</span></h4>
                                </div> 
                            </div>

                            <div class='testimonials_holder clearfix dark'>
                                <div class="testimonials testimonials_carousel" data-show-navigation="yes" data-animation-type="slide" data-animation-speed="" data-auto-rotate-slides="3" data-number-per-slide="3">
                                    <ul class="slides">
                                        <li id="testimonials7483" class="testimonial_content">
                                            <div class="testimonial_content_inner">
                                                <div class="testimonial_image_holder">
                                                    <img itemprop="image" src="wp-content/uploads/2014/01/ww-round-profile-image.png" />
                                                </div>
                                                <div class="testimonial_text_holder">
                                                    <div class="testimonial_text_inner" style="">
                                                        <p>Lorem ipsum dolor sit amet, feugiat delicata liberavisse id cum, no quo maiorum intellegebat, liber regione eu sit. Mea cu case ludus integre, vide viderer eleifend ex mea. 
                                                            His ay diceret, cum et atqui placerat.</p>
                                                        <p class="testimonial_author" style="font-weight: 700;">Alan Snow - Vision Corp.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li id="testimonials7482" class="testimonial_content">
                                            <div class="testimonial_content_inner">
                                                <div class="testimonial_image_holder">
                                                    <img itemprop="image" src="wp-content/uploads/2014/01/ww-round-profile-image.png" />
                                                </div>
                                                <div class="testimonial_text_holder">
                                                    <div class="testimonial_text_inner" style="">
                                                        <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram.</p>
                                                        <p class="testimonial_author" style="font-weight: 700;">Rick Hammer - Globe Corp.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li id="testimonials7452" class="testimonial_content">
                                            <div class="testimonial_content_inner">
                                                <div class="testimonial_image_holder">
                                                    <img itemprop="image" src="wp-content/uploads/2014/01/ww-round-profile-image.png" />
                                                </div>
                                                <div class="testimonial_text_holder">
                                                    <div class="testimonial_text_inner" style="">
                                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                                                        <p class="testimonial_author" style="font-weight: 700;">Alan Snow - Vision Corp.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li id="testimonials544" class="testimonial_content">
                                            <div class="testimonial_content_inner">
                                                <div class="testimonial_image_holder">
                                                    <img itemprop="image" src="wp-content/uploads/2014/01/ww-round-profile-image.png" />
                                                </div>
                                                <div class="testimonial_text_holder">
                                                    <div class="testimonial_text_inner" style="">
                                                        <p>Lorem ipsum dolor sit amet, feugiat delicata liberavisse id cum, no quo maiorum intellegebat, liber regione eu sit. Mea cu case ludus integre, vide viderer eleifend ex mea.</p>
                                                        <p class="testimonial_author" style="font-weight: 700;">Martin Chen<span class="author_company_divider"> - </span><span class="author_company">www.yourwebsite.zt</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>           
    </div>

    <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1475160573280 grid_section" style=' text-align:left;'>
        <div class=" section_inner clearfix">
            <div class='section_inner_margin clearfix'>
                <div class="wpb_column vc_column_container vc_col-sm-2">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper"></div>                                                                            
                    </div>                                                                        
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-8">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="vc_row wpb_row section vc_row-fluid vc_inner  vc_custom_1468407927876" style=' text-align:center;'>
                                <div class=" full_section_inner clearfix">
                                    <div class="wpb_column vc_column_container vc_col-sm-12">
                                        <div class="vc_column-inner ">
                                            <div class="wpb_wrapper">
                                                <div class="wpb_text_column wpb_content_element ">
                                                    <div class="wpb_wrapper">
                                                        <h4 style="text-align: center; text-transform: uppercase; letter-spacing: 0.2em; font-weight: 500; font-size: 25px;">Send money to brazil now</h4>
                                                    </div> 
                                                </div>
                                                <a  itemprop="url" href="login/index.html" target="_self" data-hover-background-color=#212121 data-hover-border-color=#212121 data-hover-color=#ffffff class="qbutton  medium center default" style="color: #ffffff; border-color: #0a0a0a; font-weight: 600; margin: 20px auto 0px auto; border-radius: 50px;-moz-border-radius: 50px;-webkit-border-radius: 50px; background-color: #0a0a0a;">Get Started</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wpb_column vc_column_container vc_col-sm-2">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper"></div>                                                                            
                    </div>                                                                        
                </div>                                                                    
            </div>                                                                
        </div>                                                            
    </div>

    <div class="vc_row wpb_row section vc_row-fluid  vc_custom_1469105759568 grid_section" style=' text-align:center;'>
        <div class=" section_inner clearfix">
            <div class='section_inner_margin clearfix'>
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="wpb_text_column wpb_content_element  vc_custom_1468408934200">
                                <div class="wpb_wrapper">
                                    <h4 style="text-align: center; text-transform: uppercase; letter-spacing: 0.2em; font-weight: 500; font-size: 25px;">Download our <strong>free</strong> app</h4>
                                </div> 
                            </div>
                            <div class="vc_row wpb_row section vc_row-fluid vc_inner  hide-sm" style=' text-align:left;'>
                                <div class=" full_section_inner clearfix">
                                    <div class="wpb_column vc_column_container vc_col-sm-6">
                                        <div class="vc_column-inner "><div class="wpb_wrapper">
                                                <div class="wpb_single_image wpb_content_element vc_align_right  vc_custom_1469105456278">
                                                    <div class="wpb_wrapper">
                                                        <a href="#" target="_blank">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img class="vc_single_image-img " src="wp-content/uploads/2014/04/appstore-200x79.png" width="200" height="79" alt="appstore" title="appstore" />
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="wpb_column vc_column_container vc_col-sm-6">
                                        <div class="vc_column-inner "><div class="wpb_wrapper">
                                                <div class="wpb_single_image wpb_content_element vc_align_left  vc_custom_1469105491525">
                                                    <div class="wpb_wrapper">
                                                        <a href="#" target="_blank">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img class="vc_single_image-img " src="wp-content/uploads/2014/04/playstore-200x77.png" width="200" height="77" alt="playstore" title="playstore" />
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="vc_row wpb_row section vc_row-fluid vc_inner  show-sm" style=' text-align:left;'>
                                <div class=" full_section_inner clearfix"><div class="wpb_column vc_column_container vc_col-sm-12">
                                        <div class="vc_column-inner "><div class="wpb_wrapper">
                                                <div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1470051932037">
                                                    <div class="wpb_wrapper">
                                                        <a href="#" target="_blank">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img class="vc_single_image-img " src="wp-content/uploads/2014/04/appstore-200x79.png" width="200" height="79" alt="appstore" title="appstore" />
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="wpb_single_image wpb_content_element vc_align_center  vc_custom_1470051941708">
                                                    <div class="wpb_wrapper">
                                                        <a href="#" target="_blank">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img class="vc_single_image-img " src="wp-content/uploads/2014/04/playstore-200x77.png" width="200" height="77" alt="playstore" title="playstore" />
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom-end.jspf" %>
