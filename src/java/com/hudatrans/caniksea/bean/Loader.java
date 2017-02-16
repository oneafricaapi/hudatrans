/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hudatrans.caniksea.bean;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.hudatrans.caniksea.controller.RPEngine;
import com.hudatrans.caniksea.model.Country;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author caniksea
 */
public class Loader {
    
    private final RPEngine RPENGINE = new RPEngine();
    private List<Country> countries;
    private final Gson GSON = new Gson();

    public List<Country> getCountries() {
        String s = RPENGINE.loadLookup("country");
        JsonArray jsonArray = (JsonArray) new JsonParser().parse(s);
        countries = new ArrayList<>();
        for(int i = 0; i < jsonArray.size(); i++){
            Country country = GSON.fromJson(jsonArray.get(i), Country.class);
            countries.add(country);
        }
        return countries;
    }
    
}
