/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hudatrans.caniksea.ws.client.impl;

import com.hudatrans.caniksea.ws.client.RPService;
import com.hudatrans.caniksea.ws.client.RPServiceImpl;

/**
 *
 * @author caniksea
 */
public class RPServiceEntry {
    
    public static RPService getPort(){
        RPServiceImpl service = new RPServiceImpl();
        return service.getRPServicePort();
    }
    
}
