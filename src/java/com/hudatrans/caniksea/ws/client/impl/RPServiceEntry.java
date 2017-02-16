/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hudatrans.caniksea.ws.client.impl;

import com.hudatrans.caniksea.ws.client.RPService;
import com.hudatrans.caniksea.ws.client.RPServiceImpl;
import java.net.URL;

/**
 *
 * @author caniksea
 */
public class RPServiceEntry {
    
    public static RPService getPort(){
        try{
        URL wsdlLocation = new URL("https://remitpals.com/rp/RPServiceImpl?wsdl");
        RPServiceImpl service = new RPServiceImpl(wsdlLocation);        
        return service.getRPServicePort();
        }catch(Exception xc)
        {
           
        RPServiceImpl service = new RPServiceImpl();        
        return service.getRPServicePort();  
        }
    }
    
}
