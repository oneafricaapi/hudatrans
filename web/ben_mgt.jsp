<%-- 
    Document   : ben_mgt
    Created on : Jan 26, 2017, 1:45:14 PM
    Author     : caniksea
--%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "";
    String customerName = "", customerFirstName = "";
    Set<Object> beneficiarySet = new HashSet<>();
    JsonArray beneficiaries = null, countries = null, banks = null;
    int noOfBeneficiaries = 0;
    User user = (User) session.getAttribute("user");
    if (user != null) {
        RPEngine engine = new RPEngine();
        customerFirstName = user.getFirst_name();
        customerName = user.getFirst_name() + " " + user.getLast_name();
        pageTitle = customerFirstName + "'s Beneficiary Management";

        //get beneficiaries
        beneficiarySet = (Set<Object>) session.getAttribute("beneficiaries");
        beneficiaries = engine.getJsonArrayFromObjects(beneficiarySet);
        noOfBeneficiaries = beneficiaries.size();

        //get countries
        countries = engine.getJsonArrayLookUpData("country");
        //get Banks
        banks = engine.getJsonArrayLookUpData("banks");

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
            <div class="col-md-12">
                <div class="sm-st clearfix">
                    <span class="sm-st-icon st-blue"><i class="fa fa-th-list"></i></span>
                    <div class="sm-st-info">
                        <span><%= noOfBeneficiaries%></span>
                        Total Beneficiaries
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <section class="panel">
                    <header class="panel-heading tab-bg-dark-navy-blue tab-right ">
                        <ul class="nav nav-tabs pull-right">
                            <li class="active">
                                <a data-toggle="tab" href="#home-3">
                                    <i class="fa fa-group"></i>
                                    Beneficiaries
                                </a>
                            </li>
                            <!--                            <li class="">
                                                            <a data-toggle="tab" href="#about-3">
                                                                <i class="fa fa-user"></i>
                                                                Add New
                                                            </a>
                                                        </li>-->
                        </ul>
                    </header>
                    <div class="panel-body">
                        <div class="tab-content">
                            <div id="home-3" class="tab-pane active">

                                <div class="panel">
                                    <header class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-10 col-sm-9 col-xs-12">List of Beneficiaries</div>
                                            <div class="col-md-2 col-sm-3 col-xs-12">
                                                <a href="#myModal-1" data-toggle="modal" class="btn btn-xs btn-info">
                                                    Add New Beneficiary
                                                </a>

                                                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                                <h4 class="modal-title">Add New Beneficiary</h4>
                                                            </div>
                                                            <div class="modal-body">

                                                                <!--<form class="form-horizontal" role="form">-->
                                                                <form role="form">
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-md-6 form-group">
                                                                                <input type="text" placeholder="First Name" class="form-control" required>
                                                                            </div>

                                                                            <div class="col-md-6 form-group">
                                                                                <input type="text" placeholder="Last Name" class="form-control">
                                                                            </div>

                                                                            <div class="col-md-12 form-group">
                                                                                <select id="bg_country" class="form-control" required>
                                                                                    <option>Select Country</option>
                                                                                    <option>Option 2</option>
                                                                                    <option>Option 3</option>
                                                                                </select>
                                                                            </div>

                                                                            <div class="col-md-6 form-group">
                                                                                <select id="bg_bank" class="form-control" required>
                                                                                    <option>Select Bank</option>
                                                                                    <option>Option 2</option>
                                                                                    <option>Option 3</option>
                                                                                </select>
                                                                            </div>

                                                                            <div class="col-md-6 form-group">
                                                                                <input type="number" placeholder="Account Number" required class="form-control">
                                                                            </div>

                                                                            <div class="col-md-6 col-xs-6 form-group">
                                                                                <!--<div class="col-lg-offset-10 col-lg-10">-->
                                                                                    <button type="submit" class="btn btn-info">Add</button>
                                                                                <!--</div>-->
                                                                            </div>

                                                                            <div class="col-md-6 form-group">
                                                                                <!--<div class="col-lg-offset-10 col-lg-10">-->
                                                                                <button type="reset" class="btn btn-danger" style="float: right;">clear</button>
                                                                                <!--</div>-->
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!--                                                                    <div class="form-group">
                                                                                                                                            <label for="bg_firstname" class="col-lg-4 col-sm-4 control-label">First Name</label>
                                                                                                                                            <div class="col-lg-8">
                                                                                                                                                <input type="text" class="form-control" id="bg_firstname" placeholder="First Name" required>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                        <div class="form-group">
                                                                                                                                            <label for="bg_lastname" class="col-lg-4 col-sm-4 control-label">Last Name</label>
                                                                                                                                            <div class="col-lg-8">
                                                                                                                                                <input type="text" class="form-control" id="bg_lastname" placeholder="Last Name" required>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                        <div class="form-group">
                                                                                                                                            <label class="col-sm-4 control-label col-lg-4" for="bg_country">Country</label>
                                                                                                                                            <div class="col-lg-8">
                                                                                                                                                <select id="bg_country" class="form-control m-b-10" required>
                                                                                                                                                    <option>Option 1</option>
                                                                                                                                                    <option>Option 2</option>
                                                                                                                                                    <option>Option 3</option>
                                                                                                                                                </select>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                        <div class="form-group">
                                                                                                                                            <label class="col-sm-4 control-label col-lg-4" for="bg_bank">Bank</label>
                                                                                                                                            <div class="col-lg-8">
                                                                                                                                                <select id="bg_bank" class="form-control m-b-10" required>
                                                                                                                                                    <option>Option 1</option>
                                                                                                                                                    <option>Option 2</option>
                                                                                                                                                    <option>Option 3</option>
                                                                                                                                                </select>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                        <div class="form-group">
                                                                                                                                            <label class="col-sm-4 control-label col-lg-4" for="bg_accountNo">Account Number</label>
                                                                                                                                            <div class="col-lg-8">
                                                                                                                                                <input type="number" id="bg_accountNo" placeholder="0123456789" class="form-control" required >
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                        <div class="form-group">
                                                                                                                                            <div class="col-lg-offset-2 col-lg-10">
                                                                                                                                                <button type="submit" class="btn btn-default">Add</button>
                                                                                                                                            </div>
                                                                                                                                        </div>-->
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </header>
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15">
                                            <div class="input-group">
                                                <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <table class="table table-hover">
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Country</th>
                                                <th>Bank</th>
                                                <th>Account Number</th>
                                            </tr>
                                            <%
                                                //get beneficiary name
                                                if (beneficiaries != null) {
                                                    for (int j = 0; j < beneficiaries.size(); j++) {
                                                        JsonObject p = (JsonObject) beneficiaries.get(j);
                                                        double idDbl = p.get("beneficiary_id").getAsDouble();
                                                        int id = (int) idDbl;
                                                        String idStr = String.valueOf(id);
                                                        String countryCode = p.get("country_code").getAsString();
                                                        double bankIdDbl = p.get("bank_id").getAsDouble();
                                                        int bankIdInt = (int) bankIdDbl;
                                                        String bankId = String.valueOf(bankIdInt);
                                                        String countryName = "", bankName = "";
                                                        if (countries != null) {
                                                            for (int i = 0; i < countries.size(); i++) {
                                                                JsonObject country = (JsonObject) countries.get(i);
                                                                String iso = country.get("country_iso_code").getAsString();
                                                                if (iso.equals(countryCode)) {
                                                                    countryName = country.get("country_name").getAsString();
                                                                    break;
                                                                }
                                                            }
                                                        }

                                                        if (banks != null) {
                                                            for (int i = 0; i < banks.size(); i++) {
                                                                JsonObject bank = (JsonObject) banks.get(i);
                                                                String bankid = bank.get("bank_id").getAsString();
                                                                if (bankId.equals(bankid)) {
                                                                    bankName = bank.get("bank_name").getAsString();
                                                                    break;
                                                                }
                                                            }
                                                        }

                                            %>
                                            <tr>
                                                <td><%= p.get("first_name").getAsString()%></td>
                                                <td><%= p.get("last_name").getAsString()%></td>
                                                <td><%= countryName%></td>
                                                <td><%= bankName%></td>
                                                <td><%= p.get("account_number").getAsString()%></td>
                                            </tr>
                                            <%                                    }
                                            } else {
                                            %>
                                            <tr>
                                                <td colspan="5" style="text-align: center;">You have no beneficiaries</td>
                                            </tr>
                                            <% }%>

                                        </table>
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div>
                            <div id="about-3" class="tab-pane">

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>

</aside>

<%@include file="WEB-INF/jspf/mgt_footer.jspf" %>
