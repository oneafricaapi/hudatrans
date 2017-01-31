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
    int noOfPendingTransaction = 0, noOfTransactions = 0, noOfSuccessfulTxn = 0, noOfFailedTxn = 0;
    JsonArray pendingT = null, allT = null, beneficiaries = null, successT = null, failedT = null;
    Set<Object> beneficiarySet = new HashSet<>();

//    if(currentPage.contains("arbel")) activeStyle = "active";
    if (user != null) {
        RPEngine engine = new RPEngine();
        customerFirstName = user.getFirst_name();
        customerName = user.getFirst_name() + " " + user.getLast_name();
        pageTitle = customerFirstName + "'s Dashboard";

        successMessage = (String) session.getAttribute("success");
        if (successMessage != null && !successMessage.isEmpty()) {
            showSuccess = true;
            session.removeAttribute("success");
        }

        errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null && !errorMessage.isEmpty()) {
            showError = true;
            session.removeAttribute("error");
        }

        //get pending transactions
        GenericCollectionResponse gcr = engine.getTransactions(user.getContact_id(), "PENDING");
        if (gcr.getResponse_code().equals("00")) {
            if (!gcr.getResponse_data().isEmpty()) {
                pendingT = engine.getJsonArrayFromObjects(gcr.getResponse_data());
                noOfPendingTransaction = pendingT.size();
            }
        }

        //get all transactions
        GenericCollectionResponse allTransactions = engine.getTransactions(user.getContact_id(), "ALL");
        if (allTransactions.getResponse_code().equals("00")) {
            if (!allTransactions.getResponse_data().isEmpty()) {
                allT = engine.getJsonArrayFromObjects(allTransactions.getResponse_data());
                noOfTransactions = allT.size();
            }
        }

        //get successful transactions
        GenericCollectionResponse successfulTransactions = engine.getTransactions(user.getContact_id(), "COMPLETED");
        if (successfulTransactions.getResponse_code().equals("00")) {
            if (!successfulTransactions.getResponse_data().isEmpty()) {
                successT = engine.getJsonArrayFromObjects(successfulTransactions.getResponse_data());
                noOfSuccessfulTxn = successT.size();
            }
        }

        //get successful transactions
        GenericCollectionResponse failedTransactions = engine.getTransactions(user.getContact_id(), "FAILED");
        if (failedTransactions.getResponse_code().equals("00")) {
            if (!failedTransactions.getResponse_data().isEmpty()) {
                failedT = engine.getJsonArrayFromObjects(failedTransactions.getResponse_data());
                noOfFailedTxn = failedT.size();
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
        beneficiaries = engine.getJsonArrayFromObjects(beneficiarySet);

    } else {
        response.sendRedirect("indizea");
    }
%>

<%@include file="WEB-INF/jspf/mgt_header.jspf" %>

<%@include file="WEB-INF/jspf/mgt_nav.jspf" %>

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
                        <span><%= noOfSuccessfulTxn%></span>
                        Successful Transactions
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="sm-st clearfix">
                    <span class="sm-st-icon st-red"><i class="fa fa-stop"></i></span>
                    <div class="sm-st-info">
                        <span><%= noOfFailedTxn%></span>
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
                            <strong>All good!</strong> No recent notification.
                        </div>
                        <% } else if (showError) { %>
                        <div class="alert alert-block alert-danger">
                            <button data-dismiss="alert" class="close close-sm" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                            <strong>Oh snap!</strong> Your last transaction was not successful. <%= errorMessage %>
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

<%@include file="WEB-INF/jspf/mgt_footer.jspf" %>