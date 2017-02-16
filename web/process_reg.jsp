<%-- 
    Document   : process_reg
    Created on : Jan 8, 2017, 4:44:13 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.PostGenericResponse"%>
<%@page import="com.hudatrans.caniksea.model.GenericCollectionResponse"%>
<%@page import="java.util.Set"%>
<%@page import="com.hudatrans.caniksea.model.Beneficiary"%>
<%@page import="com.hudatrans.caniksea.model.TransactionRequest"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page import="com.hudatrans.caniksea.model.RegistrationRequest"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%
    String customerFirstName = request.getParameter("r_customer_firstname");
    String customerLastName = request.getParameter("r_customer_lastname");
    String customerEmail = request.getParameter("r_customer_email");
    String customerPassword = request.getParameter("r_password");

    RegistrationRequest rr = RegistrationRequest.builder().customer_email(customerEmail)
            .customer_firstname(customerFirstName).customer_lastname(customerLastName)
            .customer_password(customerPassword).build();

    RPEngine engine = new RPEngine();
    PostGenericResponse pgr = engine.registerCustomer(rr);
    if(pgr.getResponse_code().equals("00")){
          User user = engine.getUserFromJson(pgr.getData());
        
        session.setAttribute("user", user); //set user session

        TransactionRequest tr = (TransactionRequest) session.getAttribute("TransactionRequest");
        TransactionRequest updatedTR = TransactionRequest.builder().source_amount(tr.getSource_amount())
                .destination_country(tr.getDestination_country()).pay_method(tr.getPay_method()).merchant_code(tr.getMerchant_code()).build();

        TransactionRequest responseTR = engine.initiateTransaction(updatedTR);

        if (responseTR.getResponse_code().equals("00")) {
            session.setAttribute("TransactionRequest", responseTR); //set transaction session

            GenericCollectionResponse gcr = engine.getBeneficiaries(user);

            if (gcr.getResponse_code().equals("00")) {
                session.setAttribute("beneficiaries", gcr.getResponse_data());
                response.sendRedirect("select_beneficiary");
            } else {
                session.setAttribute("error", gcr.getResponse_description());
                response.sendRedirect("registrate");
            }        
        } else {
            session.setAttribute("error", responseTR.getResponse_description());
            response.sendRedirect("registrate");

        }
    } else {
        session.setAttribute("error", pgr.getResponse_description());
        response.sendRedirect("registrate");
    }
%>