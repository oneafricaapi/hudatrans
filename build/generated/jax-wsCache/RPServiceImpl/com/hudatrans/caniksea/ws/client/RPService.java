
package com.hudatrans.caniksea.ws.client;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.6-1b01 
 * Generated source version: 2.2
 * 
 */
@WebService(name = "RPService", targetNamespace = "http://ws.caniksea.rp.com")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface RPService {


    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getCountry", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetCountry")
    @ResponseWrapper(localName = "getCountryResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetCountryResponse")
    public String getCountry(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getBank", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBank")
    @ResponseWrapper(localName = "getBankResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBankResponse")
    public String getBank(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @param reuest
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "login", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.Login")
    @ResponseWrapper(localName = "loginResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.LoginResponse")
    public String login(
        @WebParam(name = "reuest", targetNamespace = "")
        String reuest);

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getBeneficiary", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBeneficiary")
    @ResponseWrapper(localName = "getBeneficiaryResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBeneficiaryResponse")
    public String getBeneficiary(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getBanksInCountry", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBanksInCountry")
    @ResponseWrapper(localName = "getBanksInCountryResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBanksInCountryResponse")
    public String getBanksInCountry(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getPaymethods", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetPaymethods")
    @ResponseWrapper(localName = "getPaymethodsResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetPaymethodsResponse")
    public String getPaymethods();

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getBeneficiaries", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBeneficiaries")
    @ResponseWrapper(localName = "getBeneficiariesResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetBeneficiariesResponse")
    public String getBeneficiaries(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "getCountries", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetCountries")
    @ResponseWrapper(localName = "getCountriesResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.GetCountriesResponse")
    public String getCountries();

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "saveTransaction", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.SaveTransaction")
    @ResponseWrapper(localName = "saveTransactionResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.SaveTransactionResponse")
    public String saveTransaction(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "register", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.Register")
    @ResponseWrapper(localName = "registerResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.RegisterResponse")
    public String register(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "initiateTransaction", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.InitiateTransaction")
    @ResponseWrapper(localName = "initiateTransactionResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.InitiateTransactionResponse")
    public String initiateTransaction(
        @WebParam(name = "request", targetNamespace = "")
        String request);

    /**
     * 
     * @param request
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "saveBeneficiary", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.SaveBeneficiary")
    @ResponseWrapper(localName = "saveBeneficiaryResponse", targetNamespace = "http://ws.caniksea.rp.com", className = "com.hudatrans.caniksea.ws.client.SaveBeneficiaryResponse")
    public String saveBeneficiary(
        @WebParam(name = "request", targetNamespace = "")
        String request);

}