/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var service_root = "rps?";
var site_root = "http://localhost:8080/hudatrans";
var country_obj = {};

$(function () {
    //hide loading image
    $("#busyDiv, #msg-general, #msg-widget, #exchange-container, #transaction-info-div").hide();
    $("#beneficiary_info").hide();
    //init();

    $("#togglePass").click(function () {
        $("#r_password").togglePassword();
    });

    $("#destination-countries").change(function () {
        var selected_country = $(this).val();
        var imagePath = "";
        if (selected_country === "") {
            $("#exchange-container").hide();
        } else {
            country_obj = getCountry(selected_country);
            var country_currency = country_obj.country_currency === null ? "" : country_obj.country_currency;
            country_currency = country_currency === null ? "" : country_currency.toUpperCase();
            document.getElementById("receiving-currency").options.length = 0;
            document.getElementById("receiving-currency").options[0] = new Option(country_currency, "", false, false);
            $("#sending-amount, #receiving-amount, #transaction-fee, #transaction-total").val("");
            imagePath = country_obj.flag_path === undefined ? "" : site_root + country_obj.flag_path; //set flag.
        }
        $("#countryFlag").attr("src", imagePath);
        getPaymentMethod(selected_country);
    });

    $("#delivery-method").change(function () {
        var selected_paymethod = $(this).val();
        if (selected_paymethod !== "") {
            $("#exchange-container").show();
        } else {
            $("#exchange-container").hide();
        }
    });

    $("#sending-amount, #receiving-amount").keyup(function () {
        var current_val = $(this).val();
        var current_id = $(this).attr("id");
        $(this).val(current_val.replace(/\D/g, ''));
        var exchange_rate = country_obj.exchange_rate;//getCountryData($("#destination-countries").val(), "exchangeRate");
        var destinationAmount = parseFloat(current_val);
        if (current_id === "sending-amount") {
            destinationAmount = parseFloat(current_val) * parseFloat(exchange_rate);
            destinationAmount = isNaN(destinationAmount) ? "" : destinationAmount.toFixed(2);
            $("#receiving-amount").val(destinationAmount);
        } else {
            destinationAmount = parseFloat(current_val) / parseFloat(exchange_rate);
            destinationAmount = isNaN(destinationAmount) ? "" : destinationAmount.toFixed(2);
            $("#sending-amount").val(destinationAmount);
        }
        //get fee
        var amountInBaseCurrency = $("#sending-amount").val();
        amountInBaseCurrency = parseFloat(amountInBaseCurrency);
        var fee = country_obj.static_fee + ((country_obj.dynamic_fee / 100) * amountInBaseCurrency);
        var total = fee + amountInBaseCurrency;
        fee = isNaN(fee) ? "" : fee.toFixed(2);
        total = isNaN(total) ? "" : total.toFixed(2);

        $("#transaction-fee").val(fee);
        $("#transaction-total").val(total);
        if (amountInBaseCurrency === "" || destinationAmount === "")
            $("#transaction-info-div").hide();
        else
            $("#transaction-info-div").show();
    });

    $("#beneficiary_country").change(function () {
        var selected_country = $(this).val();
        if (selected_country === "") {
            document.getElementById("beneficiary_bank").options.length = 0;
            document.getElementById("beneficiary_bank").options[0] = new Option("Select Bank...", "", false, false);
        } else {
            $("#busyDiv").show();
            var url = service_root + "op=getData&datatype=banks&country_code=" + selected_country;
            $.getJSON(url, function (data) {
                if (data.response_code === "00") {
                    var element = document.getElementById("beneficiary_bank");
                    populateBanks(data, element);
                }
            }).done(function () {
                $("#busyDiv").fadeOut(500);
            });
//            var banksInCountry = getBanks(selected_country);
//            console.log(banksInCountry);
        }
    });

    $("#beneficiary").change(function () {
        var selected_beneficiary = $(this).val();
        if (selected_beneficiary === "") {
            $("#beneficiary_info").hide();
        } else {
            var url = service_root + "op=getData&datatype=beneficiary&beneficiaryId=" + selected_beneficiary;
            $.getJSON(url, function (data) {
                console.log(url, data);
                if (data.response_code === "00") {
                    var country = getCountry(data.data.country_code);
                    var bank = getBank(data.data.country_code, data.data.bank_id);
                    $("#beneficiary_info_country").html(country.country_name);
                    $("#beneficiary_info_bank").html(bank.data.bank_name);
                    $("#beneficiary_info").fadeIn(500);
                }
            }).done(function () {
                $("#busyDiv").fadeOut(500);
            });
//            var banksInCountry = getBanks(selected_country);
//            console.log(banksInCountry);
        }
    });

    $("#bg_country").change(function () {
        var selected_country = $(this).val();
        if (selected_country === "") {
            document.getElementById("bg_bank").options.length = 0;
            document.getElementById("bg_bank").options[0] = new Option("Select Bank", "", false, false);
        } else {
            $("#busyDiv").show();
            var url = service_root + "op=getData&datatype=banks&country_code=" + selected_country;
            $.getJSON(url, function (data) {
                if (data.response_code === "00") {
                    var element = document.getElementById("bg_bank");
                    populateBanks(data, element);
                }
            }).done(function () {
                $("#busyDiv").fadeOut(500);
            });
        }
    });
});

$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function populateCountry(data, element) {
    if (element) {
        element.options.length = 0;
        element.options[0] = new Option("Select...", "", false, false);
        for (var i = 0; i < data.length; i++) {
            element.options[i + 1] = new Option(data[i].country_name, data[i].country_iso_code, false, false);
        }
    }
}

function getPaymentMethod(selected_country) {
    if (selected_country !== "") {
        var url = service_root + "op=getData&datatype=paymethod";//service_root + "get_pay_methods";
        $("#busyDiv").show();
        $.getJSON(url, function (data) {
            populatePayMethods(data);
        }).done(function () {
            $("#busyDiv").fadeOut(500);
        });
    } else
        populatePayMethods({});


}

function populatePayMethods(data) {
    var element = document.getElementById("delivery-method");
    if (element) {
        element.options.length = 0;
        element.options[0] = new Option("Select...", "", false, false);
        for (var i = 0; i < data.length; i++) {
            element.options[i + 1] = new Option(data[i].method_name, data[i].id, false, false);
        }
    }
}

function getCountry(country_code) {
    var result;
    var url = service_root + "op=getData&datatype=country&country_code=" + country_code;
    $("#busyDiv").show();
    $.ajax({
        url: url, //service_root + "get_country/" + country_code,
        type: 'GET',
        dataType: 'json',
        contentType: 'application/json',
        async: false,
        success: function (data) {
            result = data; //JSON.parse(data);
        },
        complete: function (jqXHR, textStatus) {
            $("#busyDiv").hide();
        }
    });
    result = result[0] === null ? {} : result[0];
    return result;
}

function getCountryData(selected_country, data) {
    var result = getCountry(selected_country);
    if (data === "exchangeRate")
        return result[0].exchange_rate;
    else if (data === "currency")
        return result[0].country_currency;
}

function populateBanks(data, element) {
    var banks = data.response_data;
    if (banks.length > 0) {
        if (element) {
            element.options.length = 0;
            element.options[0] = new Option("Select Bank...", "", false, false);
            for (var i = 0; i < banks.length; i++) {
                element.options[i + 1] = new Option(banks[i].bank_name, banks[i].bank_id, false, false);
            }
        }
    } else {
        if (element) {
            element.options.length = 0;
            element.options[0] = new Option("Select Bank...", false, false);
        }
    }
}

function getBank(country_code, bank_id) {
    var result;
    var url = service_root + "op=getData&datatype=bank&country_code=" + country_code + "&bank_id=" + bank_id;
    $("#busyDiv").show();
    $.ajax({
        url: url, //service_root + "get_country/" + country_code,
        type: 'GET',
        dataType: 'json',
        contentType: 'application/json',
        async: false,
        success: function (data) {
            result = data; //JSON.parse(data);
        },
        complete: function (jqXHR, textStatus) {
            $("#busyDiv").hide();
        }
    });
//    result = result[0] === null ? {} : result[0];
    return result;
}

function confirmDelete(id){
    var proceed = confirm("Delete " + id + "?");
    if(!proceed) return false;
}