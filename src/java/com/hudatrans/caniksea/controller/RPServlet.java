/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hudatrans.caniksea.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.hudatrans.caniksea.model.Bank;
import com.hudatrans.caniksea.model.Beneficiary;
import com.hudatrans.caniksea.model.Country;
import com.hudatrans.caniksea.model.PostGenericResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author caniksea
 */
public class RPServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(RPServlet.class);
    private final RPEngine RP_ENGINE = new RPEngine();
    private final Gson GSON = new Gson();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("op");
            LOG.info("Operation: " + op);
            String res = "";
            switch (op) {
//                case "lookup":
//                    String type = request.getParameter("type");
//                    res = RP_ENGINE.loadLookup(type);
//                    break;
                case "getData":
                    String data = request.getParameter("datatype");
                    if (data.equals("country")) {
                        String country = request.getParameter("country_code");
                        res = RP_ENGINE.getCountry(country);
                        JsonArray jsonArray = (JsonArray) new JsonParser().parse(res);
                        if(jsonArray != null && jsonArray.size() > 0){
                            Country c = RP_ENGINE.getCountryFromJson(jsonArray);
                            if(c != null) request.getSession(false).setAttribute("beneficiary-country", c);
                        }

                    } else if (data.equals("paymethod")) {
                        res = RP_ENGINE.getPaymethods();
                    } else if (data.equals("banks")){
                        String country = request.getParameter("country_code");
                        res = RP_ENGINE.getBanksInCountry(country);
                    } else if(data.equals("beneficiary")){
                        String beneficiaryId = request.getParameter("beneficiaryId");
                        res = RP_ENGINE.getBeneficiary(beneficiaryId);
                        PostGenericResponse pgr = GSON.fromJson(res, PostGenericResponse.class);
                        if(pgr.getResponse_code().equals("00")){
                            Beneficiary beneficiary = RP_ENGINE.getBeneficiaryFromJson(pgr.getData());
                            request.getSession(false).setAttribute("beneficiary", beneficiary);
                        }
                    } else if(data.equals("bank")){
                        String country = request.getParameter("country_code");
                        String bankId = request.getParameter("bank_id");
                        res = RP_ENGINE.getBank(country, bankId);
                        PostGenericResponse pgr = GSON.fromJson(res, PostGenericResponse.class);
                        if(pgr.getResponse_code().equals("00")){
                            Bank bank = RP_ENGINE.getBankFromJson(pgr.getData());
                            request.getSession(false).setAttribute("beneficiary-bank", bank);
                        }                        
                    }
                    break;
                default:
                    break;
            }
            out.write(res);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
