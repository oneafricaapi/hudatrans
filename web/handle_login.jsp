<%-- 
    Document   : handle_login
    Created on : Jan 14, 2017, 5:08:11 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.GenericCollectionResponse"%>
<%@page import="com.hudatrans.caniksea.model.TransactionRequest"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%@page import="com.hudatrans.caniksea.model.PostGenericResponse"%>
<%@page import="com.hudatrans.caniksea.model.Login"%>
<%
    String email = request.getParameter("l_customer_email");
    String pass = request.getParameter("l_password");
    Login login = Login.builder().email(email).pass(pass).build();
    RPEngine engine = new RPEngine();
    PostGenericResponse pgr = engine.loginUser(login);
    if(pgr.getResponse_code().equals("00")){
        User user = engine.getUserFromJson(pgr.getData());
        session.setAttribute("user", user);
        
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
                response.sendRedirect("identifier");
            }        
        } else {
            session.setAttribute("error", responseTR.getResponse_description());
            response.sendRedirect("identifier");
        }
    }else{
        session.setAttribute("error", pgr.getResponse_description());
        response.sendRedirect("identifier");
    }
%>
