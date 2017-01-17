<%-- 
    Document   : handle_addBeneficiary
    Created on : Jan 14, 2017, 2:58:10 PM
    Author     : caniksea
--%>

<%@page import="com.hudatrans.caniksea.model.GenericCollectionResponse"%>
<%@page import="com.hudatrans.caniksea.model.PostGenericResponse"%>
<%@page import="com.hudatrans.caniksea.model.User"%>
<%@page import="com.hudatrans.caniksea.model.Beneficiary"%>
<%@page import="com.hudatrans.caniksea.controller.RPEngine"%>
<%
    String beneficiary_firstname = request.getParameter("beneficiary_firstname");
    String beneficiary_lastname = request.getParameter("beneficiary_lastname");
    String beneficiary_country = request.getParameter("beneficiary_country");
    String beneficiary_bank = request.getParameter("beneficiary_bank");
    String beneficiary_acc_number = request.getParameter("beneficiary_acc_number");

    try {
        int bank_id = Integer.parseInt(beneficiary_bank);
        RPEngine engine = new RPEngine();

        User user = (User) session.getAttribute("user");
        if (user != null) {
            int userId = user.getContact_id();

            Beneficiary b = Beneficiary.builder().account_number(beneficiary_acc_number).bank_id(bank_id).country_code(beneficiary_country)
                    .first_name(beneficiary_firstname).last_name(beneficiary_lastname).sender_id(userId).build();

            PostGenericResponse pgr = engine.saveBeneficiary(b);
            if (pgr.getResponse_code().equals("00")) {
                GenericCollectionResponse gcr = engine.getBeneficiaries(user);
                if (gcr.getResponse_code().equals("00")) {
                    session.setAttribute("beneficiaries", gcr.getResponse_data());
                    response.sendRedirect("select_beneficiary");
                }
            }
        }
    } catch (Exception e) {

    }

%>
