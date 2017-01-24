<%-- 
    Document   : add_sales
    Created on : Jan 17, 2017, 11:37:39 AM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.PostGenericResponse"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="java.util.Date"%>
<%@page import="com.hudatrans.caniksea.model.Country"%>
<%@page import="com.hudatrans.caniksea.model.Sale"%>
<%@page import="com.hudatrans.caniksea.model.TransactionRequest"%>
<%@page import="com.hudatrans.caniksea.model.Bank"%>
<%@page import="com.hudatrans.caniksea.model.Beneficiary"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        Beneficiary beneficiary = (Beneficiary) session.getAttribute("beneficiary");
        Bank bank = (Bank) session.getAttribute("beneficiary-bank");
        TransactionRequest tr = (TransactionRequest) session.getAttribute("TransactionRequest");
        Country country = (Country) session.getAttribute("beneficiary-country");
        
        int benId = beneficiary.getBeneficiary_id();
        String benID = String.valueOf(benId);
        
        int userId = user.getContact_id();
        String userID = String.valueOf(userId);
        
        Sale sale = Sale.builder().bank_name(bank.getBank_name()).beneficiary_account_no(beneficiary.getAccount_number())
                .beneficiary_id(benID).order_id(tr.getTransaction_id()).originator_id(userID)
                .receiving_amount(tr.getDestination_amount()).sending_amount(tr.getSource_amount())
                .currency(country.getCountry_currency()).exchange_rate(country.getExchange_rate())
                .beneficiary_country(country.getCountry_name()).total(tr.getTotal()).fee(tr.getFee()).build();
        
        RPEngine engine = new RPEngine();
        
        PostGenericResponse pgr = engine.saveTransaction(sale);
        
        if(pgr.getResponse_code().equals("00")){
            sale = engine.getSaleFromJson(pgr.getData());
            session.setAttribute("success", "Your transaction was successful.");
            response.sendRedirect("arbel");
        }
    }

%>
