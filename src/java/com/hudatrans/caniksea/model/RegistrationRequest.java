/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hudatrans.caniksea.model;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author caniksea
 */
public class RegistrationRequest implements Serializable, Comparable<RegistrationRequest> {

    private String customer_firstname, customer_lastname, customer_email, customer_password;

    private RegistrationRequest() {
    }

    public RegistrationRequest(Builder builder) {
        this.customer_email = builder.customer_email;
        this.customer_firstname = builder.customer_firstname;
        this.customer_lastname = builder.customer_lastname;
        this.customer_password = builder.customer_password;
    }

    public String getCustomer_firstname() {
        return customer_firstname;
    }

    public String getCustomer_lastname() {
        return customer_lastname;
    }

    public String getCustomer_email() {
        return customer_email;
    }

    public String getCustomer_password() {
        return customer_password;
    }

    public static class Builder {

        private String customer_firstname, customer_lastname, customer_email, customer_password;

        public Builder customer_firstname(String customer_firstname) {
            this.customer_firstname = customer_firstname;
            return this;
        }

        public Builder customer_lastname(String customer_lastname) {
            this.customer_lastname = customer_lastname;
            return this;
        }

        public Builder customer_email(String customer_email) {
            this.customer_email = customer_email;
            return this;
        }

        public Builder customer_password(String customer_password) {
            this.customer_password = customer_password;
            return this;
        }

        public Builder copy(RegistrationRequest rr) {
            this.customer_email = rr.customer_email;
            this.customer_firstname = rr.customer_firstname;
            this.customer_lastname = rr.customer_lastname;
            this.customer_password = rr.customer_password;

            return this;
        }
        
        public RegistrationRequest build(){
            return new RegistrationRequest(this);
        }

    }
    
    public static Builder builder(){
        return new Builder();
    }

    @Override
    public int compareTo(RegistrationRequest t) {
        return customer_email.compareTo(t.customer_email);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.customer_email);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final RegistrationRequest other = (RegistrationRequest) obj;
        return Objects.equals(this.customer_email, other.customer_email);
    }

    @Override
    public String toString() {
        return "RegistrationRequest{" + "customer_firstname=" + customer_firstname + ", customer_lastname=" + customer_lastname + ", customer_email=" + customer_email + ", customer_password=" + customer_password + '}';
    }

}
