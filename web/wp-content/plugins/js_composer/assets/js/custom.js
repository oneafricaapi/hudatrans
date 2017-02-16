/* global currencyCode, exchangeRate */

var matched, browser, backgroundID;
$ = jQuery;

jQuery.uaMatch = function( ua ) {
    ua = ua.toLowerCase();

    var match = /(chrome)[ \/]([\w.]+)/.exec( ua ) ||
        /(webkit)[ \/]([\w.]+)/.exec( ua ) ||
        /(opera)(?:.*version|)[ \/]([\w.]+)/.exec( ua ) ||
        /(msie) ([\w.]+)/.exec( ua ) ||
        ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec( ua ) ||
        [];

    return {
        browser: match[ 1 ] || "",
        version: match[ 2 ] || "0"
    };
};

matched = jQuery.uaMatch( navigator.userAgent );
browser = {};

if ( matched.browser ) {
    browser[ matched.browser ] = true;
    browser.version = matched.version;
}

// Chrome is Webkit, but Webkit is also Safari.
if ( browser.chrome ) {
    browser.webkit = true;
} else if ( browser.webkit ) {
    browser.safari = true;
}

jQuery.browser = browser;
jQuery(document).ready(function ($)
{
    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        loading: true,
        loadingParentElement: 'body', //animsition wrapper element
        loadingClass: 'animsition-loading',
        unSupportCss: ['animation-duration',
            '-webkit-animation-duration',
            '-o-animation-duration'
        ],
        overlay: false,
        overlayClass: 'animsition-overlay-slide',
        overlayParentElement: 'body'
    });
});



/* mobile menu */

jQuery(document).ready(function ($) {
    "use strict";
    backgroundID = 1;
    setInterval(function() {        
        backgroundID = (backgroundID === 3 ? 1 : (backgroundID + 1));
        var remvClasss = "pb" + (backgroundID === 1 ? 3 : (backgroundID-1));
        var addClasss = "pb" + backgroundID;
        $(".page-background").fadeOut("slow").removeClass(remvClasss).addClass(addClasss).fadeIn("slow");
    }, 60 * 1000); 


    $(".groupButton").click(function() {
        $(".groupButton").removeClass("groupButtonSelected");
        $(".groupPannel").hide();
        var id = $(this).data("id");
        $("#"+id).show();
        $(this).addClass("groupButtonSelected");
    });


    $( ".datepicker" ).datepicker({
            changeYear: true,
            changeMonth: true,
            yearRange: "-100:+0"
        });
    
    var slide = false;
    $(".mobile-menu-show").on("click", function () {

        if (slide === false) {
            $(".mobile-menu-wrapper").slideDown("slow");
            slide = true;
        }
        else {
            $(".mobile-menu-wrapper").slideUp("slow");
            slide = false;
        }
    });
    
    
    jQuery('.main-menu .sf-menu').superfish({
            delay:	300,	// one second delay on mouseout 
            animation:   {opacity:'show',height:'show'}, // fade-in and slide-down animation
            speed:       'fast',  // faster animation speed 
            autoArrows:  true,   // generation of arrow mark-up (for submenu) 
            dropShadows: true
    });
    
    if($("#receivingCurrency").length && $("#selectReceivingCountry").length) {
        $("#receivingCurrency").text(currencyCode[$("#selectReceivingCountry").val()][0]);
        $("#sendingCurrency").text(currencyCode[$("#selectSendCountry").val()][0]);
    }
    
    if($("#selectSendCountry").length) {
        var b = currencyCode[$("#selectSendCountry").val()][0] + currencyCode[$("#selectReceivingCountry").val()][0];    
        $("#exchangeRate").text("Exchange rate 1 = " + (exchangeRate[b]  === undefined ? "1" : exchangeRate[b]));
    }
    
    $("#SendingAmountInput").keyup(function() {
        if($("#selectSendCountry").length && $("#selectReceivingCountry").length) {
            var b = currencyCode[$("#selectSendCountry").val()][0] + currencyCode[$("#selectReceivingCountry").val()][0];
            if($("#SendingAmountInput").val() && !isNaN($("#SendingAmountInput").val()) && $("#SendingAmountInput").val() > 0) {
                var fees = ($("#SendingAmountInput").val() * (currencyCode[$("#selectSendCountry").val()][2]/100));

                var sendAmount = $("#SendingAmountInput").val();
                var recieveAmount = (exchangeRate[b]  === undefined ? 1 : exchangeRate[b]) * sendAmount;

                $("#sendAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(sendAmount));
                $("#feeAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(fees.toFixed(2)));

                var totalAmount = parseFloat(fees) + parseFloat(sendAmount);
                $("#totalAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(totalAmount.toFixed(2)));
                $("#ReceivingAmountInput").val(recieveAmount.toFixed(2)); 
                $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " " + numberWithCommas(recieveAmount.toFixed(2)));
            }else {
                $("#ReceivingAmountInput").val("");
                $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " 0");
                $("#sendAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
                $("#feeAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
                $("#totalAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
            }
        }
    });
    
    $("#SendingAmountInput").keyup();
    
    $("#ReceivingAmountInput").keyup(function() {
        if($("#selectSendCountry").length && $("#selectReceivingCountry").length) 
        {
            if($("#ReceivingAmountInput").val() && !isNaN($("#ReceivingAmountInput").val()) && $("#ReceivingAmountInput").val() > 0) {
                var b = currencyCode[$("#selectSendCountry").val()][0] + currencyCode[$("#selectReceivingCountry").val()][0];

                var recieveAmount = $("#ReceivingAmountInput").val();
                var sendAmount = recieveAmount / (exchangeRate[b]  === undefined ? 1 : exchangeRate[b]);
                var fees = (sendAmount * (currencyCode[$("#selectSendCountry").val()][2]/100));

                $("#sendAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(sendAmount.toFixed(2)));
                $("#feeAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(fees.toFixed(2)));

                var totalAmount = parseFloat(fees) + parseFloat(sendAmount);
                $("#totalAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(totalAmount.toFixed(2)));

                $("#SendingAmountInput").val(sendAmount.toFixed(2)); 
                $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " " + numberWithCommas(recieveAmount));

            }else {
                $("#SendingAmountInput").val("");
                $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " 0");
                $("#sendAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
                $("#feeAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
                $("#totalAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
            }
        }
    });
    
    if($("#sendersCountry").length) {
        
        var b = currencyCode[$("#sendersCountry").attr("data-id")][0] + currencyCode[$("#receiversCountry").attr("data-id")][0];

        var fees = ($("#SendingAmountInput").val() * (currencyCode[$("#receiversCountry").attr("data-id")][2]/100));

        var sendAmount = $("#SendingAmountInput").val();
        var recieveAmount = (exchangeRate[b]  === undefined ? 1 : exchangeRate[b]) * sendAmount;

        $("#sendAmount").text(currencyCode[$("#sendersCountry").attr("data-id")][0] + " " + numberWithCommas(sendAmount));
        $("#feeAmount").text(currencyCode[$("#sendersCountry").attr("data-id")][0] + " " + numberWithCommas(fees.toFixed(2)));

        var totalAmount = parseFloat(fees) + parseFloat(sendAmount);
        
        $("#SendingAmountInput").val(numberWithCommas(sendAmount));
        
        $("#totalAmount").text(currencyCode[$("#sendersCountry").attr("data-id")][0] + " " + numberWithCommas(totalAmount.toFixed(2)));
        $("#ReceivingAmountInput").val(numberWithCommas(recieveAmount.toFixed(2))); 
        $("#recipientAmount").text(currencyCode[$("#receiversCountry").attr("data-id")][0] + " " + numberWithCommas(recieveAmount.toFixed(2)));
        
        $("#exchangeRate").text("Exchange rate 1 = " + (exchangeRate[b]  === undefined ? "1" : exchangeRate[b]));
        
        $("#totalAmount2").text(currencyCode[$("#sendersCountry").attr("data-id")][0] + " " + numberWithCommas(totalAmount.toFixed(2)));
    }
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function receivingCountry(element) {
    $("#receivingCurrency").text(currencyCode[$(element).val()][0]);
    
    var b = currencyCode[$("#selectSendCountry").val()][0] + currencyCode[$("#selectReceivingCountry").val()][0];    
    $("#exchangeRate").text("Exchange rate 1 = " + (exchangeRate[b]  === undefined ? "1" : exchangeRate[b]));

    if($("#SendingAmountInput").val() && !isNaN($("#SendingAmountInput").val()) && $("#SendingAmountInput").val() > 0) {
        var fees = ($("#SendingAmountInput").val() * (currencyCode[$(element).val()][2]/100));
        
        var sendAmount = $("#SendingAmountInput").val();
        
        var recieveAmount = (exchangeRate[b]  === undefined ? 1 : exchangeRate[b]) * sendAmount;
        
        
        
        $("#sendAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(sendAmount));
        
        $("#feeAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(fees.toFixed(2)));
        
        var totalAmount = parseFloat(fees) + parseFloat(sendAmount);
        
        $("#totalAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " " + numberWithCommas(totalAmount));
        
        $("#ReceivingAmountInput").val(recieveAmount.toFixed(2)); 
        $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " " + numberWithCommas(recieveAmount.toFixed(2)));        
    }else {
            $("#ReceivingAmountInput").val("");
            $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " 0");
            $("#sendAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
            $("#feeAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
            $("#totalAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
    }
    
}

function sendCountry(element) {
    $("#sendingCurrency").text(currencyCode[$(element).val()][0]);
    
    var b = currencyCode[$("#selectSendCountry").val()][0] + currencyCode[$("#selectReceivingCountry").val()][0];    
    $("#exchangeRate").text("Exchange rate 1 = " + (exchangeRate[b]  === undefined ? "1" : exchangeRate[b]));
    
    if($("#ReceivingAmountInput").val() && !isNaN($("#ReceivingAmountInput").val()) && $("#ReceivingAmountInput").val() > 0) {
       var fees = ($("#SendingAmountInput").val() * (currencyCode[$(element).val()][2]/100));
        var sendAmount = $("#SendingAmountInput").val();
        var recieveAmount = (exchangeRate[b]  === undefined ? 1 : exchangeRate[b]) * sendAmount;
        $("#sendAmount").text(currencyCode[$(element).val()][0] + " " + numberWithCommas(sendAmount));
        
        $("#feeAmount").text(currencyCode[$(element).val()][0] + " " + numberWithCommas(fees.toFixed(2)));
        
        var totalAmount = parseFloat(fees) + parseFloat(sendAmount);
        $("#totalAmount").text(currencyCode[$(element).val()][0] + " " + numberWithCommas(totalAmount));
        
        $("#ReceivingAmountInput").val(recieveAmount.toFixed(2));
        $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " " + numberWithCommas(recieveAmount.toFixed(2)));
    }else {
        $("#ReceivingAmountInput").val("");
        $("#recipientAmount").text(currencyCode[$("#selectReceivingCountry").val()][0] + " 0");
        $("#sendAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
        $("#feeAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
        $("#totalAmount").text(currencyCode[$("#selectSendCountry").val()][0] + " 0");
    }
}

