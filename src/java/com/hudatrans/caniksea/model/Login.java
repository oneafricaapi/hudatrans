/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hudatrans.caniksea.model;

import java.io.Serializable;

/**
 *
 * @author caniksea
 */
public class Login implements Serializable{
    
    private String email, pass;
    
    private Login(){}
    
    public Login(Builder builder){
        this.email = builder.email;
        this.pass = builder.pass;
    }

    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }
    
    public static class Builder{
        private String email, pass;
        
        public Builder email(String email){
            this.email = email;
            return this;
        }
        
        public Builder pass(String pass){
            this.pass = pass;
            return this;
        }
        
        public Builder copy(Login login){
            this.email = login.email;
            this.pass = login.pass;
            
            return this;
        }
        
        public Login build(){
            return new Login(this);
        }
    }
    
    public static Builder builder(){return new Builder();}
    
}
