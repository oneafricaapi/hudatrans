// Flag container template
function formatState(state) {
    if (!state.id) {
        return state.text;
    }
    var $state = jQuery(
        '<span><img src="http://46.101.28.57/flags/' + state.element.text + '.png" class="img-flag" /> ' + '</span>' + '<span class="text">' + state.text + '</span>'
    );
    return $state;
}
// Flag container template init
jQuery(document).ready(function() {
    jQuery('.flag-container select').select2({
        templateResult: formatState,
        templateSelection: formatState,
        placeholder: "Select..."
    });
});


// Angular begins
var app = angular.module('myApp', ['ngResource']).filter('object2Array', function() {
    return function(input) {
        var out = [];
        for (var i in input) {
            out.push(input[i]);
        }
        return out;
    };
});

app.controller('SendMoney', function($scope, Calculate, SupportedCurrencies, DestinationCountries, DeliveryMethods, Airtime, WalletSupportedCurrencies) {

    $scope.countries = [{ "name": "Abkhazia", "telephone_code": "+995" }, { "name": "Afghanistan", "telephone_code": "+93" }, { "name": "Aland", "telephone_code": "+358-18" }, { "name": "Albania", "telephone_code": "+355" }, { "name": "Algeria", "telephone_code": "+213" }, { "name": "American Samoa", "telephone_code": "+1-684" }, { "name": "Andorra", "telephone_code": "+376" }, { "name": "Angola", "telephone_code": "+244" }, { "name": "Anguilla", "telephone_code": "+1-264" }, { "name": "Antarctica", "telephone_code": "" }, { "name": "Antigua and Barbuda", "telephone_code": "+1-268" }, { "name": "Argentina", "telephone_code": "+54" }, { "name": "Armenia", "telephone_code": "+374" }, { "name": "Aruba", "telephone_code": "+297" }, { "name": "Ascension", "telephone_code": "+247" }, { "name": "Ashmore and Cartier Islands", "telephone_code": "" }, { "name": "Australia", "telephone_code": "+61" }, { "name": "Australian Antarctic Territory", "telephone_code": "" }, { "name": "Austria", "telephone_code": "+43" }, { "name": "Azerbaijan", "telephone_code": "+994" }, { "name": "Bahamas", "telephone_code": "+1-242" }, { "name": "Bahrain", "telephone_code": "+973" }, { "name": "Baker Island", "telephone_code": "" }, { "name": "Bangladesh", "telephone_code": "+880" }, { "name": "Barbados", "telephone_code": "+1-246" }, { "name": "Belarus", "telephone_code": "+375" }, { "name": "Belgium", "telephone_code": "+32" }, { "name": "Belize", "telephone_code": "+501" }, { "name": "Benin", "telephone_code": "+229" }, { "name": "Bermuda", "telephone_code": "+1-441" }, { "name": "Bhutan", "telephone_code": "+975" }, { "name": "Bolivia", "telephone_code": "+591" }, { "name": "Bosnia and Herzegovina", "telephone_code": "+387" }, { "name": "Botswana", "telephone_code": "+267" }, { "name": "Bouvet Island", "telephone_code": "" }, { "name": "Brazil", "telephone_code": "+55" }, { "name": "British Antarctic Territory", "telephone_code": "" }, { "name": "British Indian Ocean Territory", "telephone_code": "+246" }, { "name": "British Sovereign Base Areas", "telephone_code": "+357" }, { "name": "British Virgin Islands", "telephone_code": "+1-284" }, { "name": "Brunei", "telephone_code": "+673" }, { "name": "Bulgaria", "telephone_code": "+359" }, { "name": "Burkina Faso", "telephone_code": "+226" }, { "name": "Burundi", "telephone_code": "+257" }, { "name": "Cambodia", "telephone_code": "+855" }, { "name": "Cameroon", "telephone_code": "+237" }, { "name": "Canada", "telephone_code": "+1" }, { "name": "Cape Verde", "telephone_code": "+238" }, { "name": "Cayman Islands", "telephone_code": "+1-345" }, { "name": "Central African Republic", "telephone_code": "+236" }, { "name": "Chad", "telephone_code": "+235" }, { "name": "Chile", "telephone_code": "+56" }, { "name": "China", "telephone_code": "+86" }, { "name": "Christmas Island", "telephone_code": "+61" }, { "name": "Clipperton Island", "telephone_code": "" }, { "name": "Cocos (Keeling) Islands", "telephone_code": "+61" }, { "name": "Colombia", "telephone_code": "+57" }, { "name": "Comoros", "telephone_code": "+269" }, { "name": "Congo", "telephone_code": "+242" }, { "name": "Cook Islands", "telephone_code": "+682" }, { "name": "Coral Sea Islands", "telephone_code": "" }, { "name": "Costa Rica", "telephone_code": "+506" }, { "name": "Croatia", "telephone_code": "+385" }, { "name": "Cuba", "telephone_code": "+53" }, { "name": "Cyprus", "telephone_code": "+357" }, { "name": "Czech Republic", "telephone_code": "+420" }, { "name": "Democratic Republic of the Congo", "telephone_code": "+243" }, { "name": "Denmark", "telephone_code": "+45" }, { "name": "Djibouti", "telephone_code": "+253" }, { "name": "Dominica", "telephone_code": "+1-767" }, { "name": "Dominican Republic", "telephone_code": "+1-809 and 1-829" }, { "name": "Ecuador", "telephone_code": "+593" }, { "name": "Egypt", "telephone_code": "+20" }, { "name": "El Salvador", "telephone_code": "+503" }, { "name": "Equatorial Guinea", "telephone_code": "+240" }, { "name": "Eritrea", "telephone_code": "+291" }, { "name": "Estonia", "telephone_code": "+372" }, { "name": "Ethiopia", "telephone_code": "+251" }, { "name": "Falkland Islands (Islas Malvinas)", "telephone_code": "+500" }, { "name": "Faroe Islands", "telephone_code": "+298" }, { "name": "Fiji", "telephone_code": "+679" }, { "name": "Finland", "telephone_code": "+358" }, { "name": "France", "telephone_code": "+33" }, { "name": "French Guiana", "telephone_code": "+594" }, { "name": "French Polynesia", "telephone_code": "+689" }, { "name": "French Southern and Antarctic Lands", "telephone_code": "" }, { "name": "Gabon", "telephone_code": "+241" }, { "name": "Gambia", "telephone_code": "+220" }, { "name": "Georgia", "telephone_code": "+995" }, { "name": "Germany", "telephone_code": "+49" }, { "name": "Ghana", "telephone_code": "+233" }, { "name": "Gibraltar", "telephone_code": "+350" }, { "name": "Greece", "telephone_code": "+30" }, { "name": "Greenland", "telephone_code": "+299" }, { "name": "Grenada", "telephone_code": "+1-473" }, { "name": "Guadeloupe", "telephone_code": "+590" }, { "name": "Guam", "telephone_code": "+1-671" }, { "name": "Guatemala", "telephone_code": "+502" }, { "name": "Guernsey", "telephone_code": "+44" }, { "name": "Guinea", "telephone_code": "+224" }, { "name": "Guinea Bissau", "telephone_code": "+245" }, { "name": "Guyana", "telephone_code": "+592" }, { "name": "Haiti", "telephone_code": "+509" }, { "name": "Heard Island and McDonald Islands", "telephone_code": "" }, { "name": "Honduras", "telephone_code": "+504" }, { "name": "Hong Kong", "telephone_code": "+852" }, { "name": "Howland Island", "telephone_code": "" }, { "name": "Hungary", "telephone_code": "+36" }, { "name": "Iceland", "telephone_code": "+354" }, { "name": "India", "telephone_code": "+91" }, { "name": "Indonesia", "telephone_code": "+62" }, { "name": "Iran", "telephone_code": "+98" }, { "name": "Iraq", "telephone_code": "+964" }, { "name": "Ireland", "telephone_code": "+353" }, { "name": "Isle of Man", "telephone_code": "+44" }, { "name": "Israel", "telephone_code": "+972" }, { "name": "Italy", "telephone_code": "+39" }, { "name": "Ivory Coast", "telephone_code": "+225" }, { "name": "Jamaica", "telephone_code": "+1-876" }, { "name": "Japan", "telephone_code": "+81" }, { "name": "Jarvis Island", "telephone_code": "" }, { "name": "Jersey", "telephone_code": "+44" }, { "name": "Johnston Atoll", "telephone_code": "" }, { "name": "Jordan", "telephone_code": "+962" }, { "name": "Kazakhstan", "telephone_code": "+7" }, { "name": "Kenya", "telephone_code": "+254" }, { "name": "Kingman Reef", "telephone_code": "" }, { "name": "Kiribati", "telephone_code": "+686" }, { "name": "Kosovo", "telephone_code": "+381" }, { "name": "Kuwait", "telephone_code": "+965" }, { "name": "Kyrgyzstan", "telephone_code": "+996" }, { "name": "Laos", "telephone_code": "+856" }, { "name": "Latvia", "telephone_code": "+371" }, { "name": "Lebanon", "telephone_code": "+961" }, { "name": "Lesotho", "telephone_code": "+266" }, { "name": "Liberia", "telephone_code": "+231" }, { "name": "Libya", "telephone_code": "+218" }, { "name": "Liechtenstein", "telephone_code": "+423" }, { "name": "Lithuania", "telephone_code": "+370" }, { "name": "Luxembourg", "telephone_code": "+352" }, { "name": "Macau", "telephone_code": "+853" }, { "name": "Macedonia", "telephone_code": "+389" }, { "name": "Madagascar", "telephone_code": "+261" }, { "name": "Malawi", "telephone_code": "+265" }, { "name": "Malaysia", "telephone_code": "+60" }, { "name": "Maldives", "telephone_code": "+960" }, { "name": "Mali", "telephone_code": "+223" }, { "name": "Malta", "telephone_code": "+356" }, { "name": "Marshall Islands", "telephone_code": "+692" }, { "name": "Martinique", "telephone_code": "+596" }, { "name": "Mauritania", "telephone_code": "+222" }, { "name": "Mauritius", "telephone_code": "+230" }, { "name": "Mayotte", "telephone_code": "+262" }, { "name": "Mexico", "telephone_code": "+52" }, { "name": "Micronesia", "telephone_code": "+691" }, { "name": "Midway Islands", "telephone_code": "" }, { "name": "Moldova", "telephone_code": "+373" }, { "name": "Monaco", "telephone_code": "+377" }, { "name": "Mongolia", "telephone_code": "+976" }, { "name": "Montenegro", "telephone_code": "+382" }, { "name": "Montserrat", "telephone_code": "+1-664" }, { "name": "Morocco", "telephone_code": "+212" }, { "name": "Mozambique", "telephone_code": "+258" }, { "name": "Myanmar", "telephone_code": "+95" }, { "name": "Nagorno-Karabakh", "telephone_code": "+374-97" }, { "name": "Namibia", "telephone_code": "+264" }, { "name": "Nauru", "telephone_code": "+674" }, { "name": "Navassa Island", "telephone_code": "" }, { "name": "Nepal", "telephone_code": "+977" }, { "name": "Netherlands", "telephone_code": "+31" }, { "name": "Netherlands Antilles", "telephone_code": "+599" }, { "name": "New Caledonia", "telephone_code": "+687" }, { "name": "New Zealand", "telephone_code": "+64" }, { "name": "Nicaragua", "telephone_code": "+505" }, { "name": "Niger", "telephone_code": "+227" }, { "name": "Nigeria", "telephone_code": "+234" }, { "name": "Niue", "telephone_code": "+683" }, { "name": "Norfolk Island", "telephone_code": "+672" }, { "name": "Northern Cyprus", "telephone_code": "+90-392" }, { "name": "Northern Mariana Islands", "telephone_code": "+1-670" }, { "name": "North Korea", "telephone_code": "+850" }, { "name": "Norway", "telephone_code": "+47" }, { "name": "Oman", "telephone_code": "+968" }, { "name": "Pakistan", "telephone_code": "+92" }, { "name": "Palau", "telephone_code": "+680" }, { "name": "Palestine", "telephone_code": "+970" }, { "name": "Palmyra Atoll", "telephone_code": "" }, { "name": "Panama", "telephone_code": "+507" }, { "name": "Papua New Guinea", "telephone_code": "+675" }, { "name": "Paraguay", "telephone_code": "+595" }, { "name": "Peru", "telephone_code": "+51" }, { "name": "Peter I Island", "telephone_code": "" }, { "name": "Philippines", "telephone_code": "+63" }, { "name": "Pitcairn Islands", "telephone_code": "" }, { "name": "Poland", "telephone_code": "+48" }, { "name": "Portugal", "telephone_code": "+351" }, { "name": "Pridnestrovie (Transnistria)", "telephone_code": "+373-533" }, { "name": "Puerto Rico", "telephone_code": "+1-787 and 1-939" }, { "name": "Qatar", "telephone_code": "+974" }, { "name": "Queen Maud Land", "telephone_code": "" }, { "name": "Reunion", "telephone_code": "+262" }, { "name": "Romania", "telephone_code": "+40" }, { "name": "Ross Dependency", "telephone_code": "" }, { "name": "Russia", "telephone_code": "+7" }, { "name": "Rwanda", "telephone_code": "+250" }, { "name": "Saint Barthelemy", "telephone_code": "+590" }, { "name": "Saint Helena", "telephone_code": "+290" }, { "name": "Saint Martin", "telephone_code": "+590" }, { "name": "Saint Pierre and Miquelon", "telephone_code": "+508" }, { "name": "Samoa", "telephone_code": "+685" }, { "name": "San Marino", "telephone_code": "+378" }, { "name": "Sao Tome and Principe", "telephone_code": "+239" }, { "name": "Saudi Arabia", "telephone_code": "+966" }, { "name": "Senegal", "telephone_code": "+221" }, { "name": "Serbia", "telephone_code": "+381" }, { "name": "Seychelles", "telephone_code": "+248" }, { "name": "Sierra Leone", "telephone_code": "+232" }, { "name": "Singapore", "telephone_code": "+65" }, { "name": "Slovakia", "telephone_code": "+421" }, { "name": "Slovenia", "telephone_code": "+386" }, { "name": "Solomon Islands", "telephone_code": "+677" }, { "name": "Somalia", "telephone_code": "+252" }, { "name": "Somaliland", "telephone_code": "+252" }, { "name": "South Africa", "telephone_code": "+27" }, { "name": "South Georgia and the South Sandwich Islands", "telephone_code": "" }, { "name": "South Korea", "telephone_code": "+82" }, { "name": "South Ossetia", "telephone_code": "+995" }, { "name": "Spain", "telephone_code": "+34" }, { "name": "Sri Lanka", "telephone_code": "+94" }, { "name": "St Kitts and Nevis", "telephone_code": "+1-869" }, { "name": "St Lucia", "telephone_code": "+1-758" }, { "name": "St Vincent Grenadines", "telephone_code": "+1-784" }, { "name": "Sudan", "telephone_code": "+249" }, { "name": "Suriname", "telephone_code": "+597" }, { "name": "Svalbard", "telephone_code": "+47" }, { "name": "Swaziland", "telephone_code": "+268" }, { "name": "Sweden", "telephone_code": "+46" }, { "name": "Switzerland", "telephone_code": "+41" }, { "name": "Syria", "telephone_code": "+963" }, { "name": "Taiwan", "telephone_code": "+886" }, { "name": "Tajikistan", "telephone_code": "+992" }, { "name": "Tanzania", "telephone_code": "+255" }, { "name": "Thailand", "telephone_code": "+66" }, { "name": "Timor-Leste (East Timor)", "telephone_code": "+670" }, { "name": "Togo", "telephone_code": "+228" }, { "name": "Tokelau", "telephone_code": "+690" }, { "name": "Tonga", "telephone_code": "+676" }, { "name": "Trinidad and Tobago", "telephone_code": "+1-868" }, { "name": "Tristan da Cunha", "telephone_code": "+290" }, { "name": "Tunisia", "telephone_code": "+216" }, { "name": "Turkey", "telephone_code": "+90" }, { "name": "Turkmenistan", "telephone_code": "+993" }, { "name": "Turks and Caicos", "telephone_code": "+1-649" }, { "name": "Tuvalu", "telephone_code": "+688" }, { "name": "Uganda", "telephone_code": "+256" }, { "name": "Ukraine", "telephone_code": "+380" }, { "name": "United Arab Emirates", "telephone_code": "+971" }, { "name": "United Kingdom", "telephone_code": "+44" }, { "name": "United States", "telephone_code": "+1" }, { "name": "Uruguay", "telephone_code": "+598" }, { "name": "U.S. Virgin Islands", "telephone_code": "+1-340" }, { "name": "Uzbekistan", "telephone_code": "+998" }, { "name": "Vanuatu", "telephone_code": "+678" }, { "name": "Vatican City", "telephone_code": "+379" }, { "name": "Venezuela", "telephone_code": "+58" }, { "name": "Vietnam", "telephone_code": "+84" }, { "name": "Wake Island", "telephone_code": "" }, { "name": "Wallis and Futuna", "telephone_code": "+681" }, { "name": "Western Sahara", "telephone_code": "+212" }, { "name": "Yemen", "telephone_code": "+967" }, { "name": "Zambia", "telephone_code": "+260" }, { "name": "Zimbabwe", "telephone_code": "+263" }];

    // http services
    $scope.fetchSupportedCountries = function() {
        var datas = {
            'data': {}
        };
        DestinationCountries.post(angular.toJson(datas), function(data) {
            console.log("DestinationCountries::: " + angular.toJson(data));
            if (data.status === "SUCCESS") {
                $scope.countryListLoaded = true;
                $scope.destinationCountries = data.data.countries;
                console.log($scope.destinationCountries);
                // avoiding  Error: $digest already in progress
                setTimeout(function() {
                    var selectList = jQuery('#destination-countries option');

                    function sort(a, b) {
                        a = a.text.toLowerCase();
                        b = b.text.toLowerCase();
                        if (a > b) {
                            return 1;
                        } else if (a < b) {
                            return -1;
                        }
                        return 0;
                    }
                    selectList.sort(sort);
                    jQuery('#destination-countries').html(selectList).find('option').removeAttr("selected");
                }, 100);
            } else {
                message.open('error', 'Service not available. Please try again later.', '#msg-general');
            }
        });
    };

    $scope.fetchSupportedDeliveryMethdods = function() {
        console.log($scope.destinationCountry);
        var datas = {
            'data': {
                'destination_country': $scope.destinationCountry
            }
        };
        DeliveryMethods.post(angular.toJson(datas), function(data) {
            console.log("DeliveryMethods::: " + angular.toJson(data));
            if (data.status === "SUCCESS") {
                $scope.deliveryMethod = '';
                $scope.deliveryMethods = [];
                jQuery.each(data.data.currencies, function(index, value) {
                    if (value === "ACCOUNTPAYMENT") {
                        $scope.deliveryMethods.push({
                            name: value,
                            display: "Bank Transfer"
                        });
                    } else if (value === "AIRTIME_TOPUP") {
                        $scope.deliveryMethods.push({
                            name: value,
                            display: "Airtime Topup"
                        });
                    } else if (value === "CASHPICKUP") {
                        $scope.deliveryMethods.push({
                            name: value,
                            display: "Cash Pickup"
                        });
                    } else if (value === "MOBILE_MONEY") {
                        $scope.deliveryMethods.push({
                            name: value,
                            display: "Mobile Money"
                        });
                    } else if (value === "WALLET") {
                        $scope.deliveryMethods.push({
                            name: value,
                            display: "Wallet Transfer"
                        });
                    } else {
                        $scope.deliveryMethods.push({
                            name: value,
                            display: value
                        });
                    }
                });
            }
        });
    };

    $scope.fetchSupportedSendingCurrencies = function() {
        var datas = {
            'data': {
                'platform': 'web',
                'destination_country': $scope.destinationCountry,
                'sub_action': 'currency_from',
                'uuid': '000000',
                'delivery_method': $scope.deliveryMethod
            }
        };

        if ($scope.deliveryMethod === "WALLET") {
            WalletSupportedCurrencies.post(angular.toJson(datas), function(data) {
                if (data.status === "SUCCESS") {
                    $scope.walletCurrencies = data.data.currencies;
                    $scope.walletCurrency = $scope.walletCurrencies[0]
                }
            });
        } else {
            SupportedCurrencies.post(angular.toJson(datas), function(data) {
                if (data.status === "SUCCESS") {
                    $scope.currenciesF = data.data.currencies;
                    $scope.currencyFrom = data.data.currencies[0];
                    $scope.currencyFromListener();
                }
            });
        }
    };

    $scope.fetchSupportedReceivingCurrencies = function() {
        var datas = {
            'data': {
                'sub_action': 'currency_to',
                'currency_from': $scope.currencyFrom,
                'destination_country': $scope.destinationCountry,
                'delivery_method': $scope.deliveryMethod
            }
        };
        SupportedCurrencies.post(angular.toJson(datas), function(data) {
            console.log("SupportedReceivingCurrencies::: " + angular.toJson(data));
            if (data.status === "SUCCESS") {
                $scope.currenciesT = data.data.currencies;
                $scope.currencyTo = data.data.currencies[0];
            }
        });
    };

    $scope.sendAirtimeNumber = function() {
        var datas = {
            'data': {
                'phoneNumber': $scope.airtimeNumber,
                'destinationCountry': $scope.destinationCountry,
                'subAction': 'lookUp'
            }
        };
        Airtime.post(angular.toJson(datas), function(data) {
            if (data.status === "SUCCESS") {
                $scope.loading = '';
                $scope.TopUpAmounts = data.data.topupProductList;
                $scope.operator = data.data.operatorLogo;
                jQuery('#airtime-input').blur();
                $scope.widget.numberFound();
            } else {
                console.log(data.message);
                $scope.loading = '';
                $scope.widget.numberNotFound();
            }
        });
    };

    $scope.airtimeCalculate = function() {
        var datas = {
            'data': {
                'phoneNumber': $scope.airtimeNumber,
                'destinationCountry': $scope.destinationCountry,
                'subAction': 'calculate',
                'topupAmount': $scope.topupAmount
            }
        };
        Airtime.post(angular.toJson(datas), function(data) {
            if (data.status === "SUCCESS") {
                $scope.page_amount = $scope.TopUpAmount;
                $scope.page_sendingCurrency = $scope.currencyTo;
                $scope.page_charges = data.data.charge;
                $scope.page_charges_currency = data.data.currencyCode;
                $scope.page_total_amount = data.data.totalAmount;
                $scope.page_total_amount_currency = data.data.currencyCode;
                $scope.page_receiving_amount = $scope.TopUpAmount;
                $scope.page_beneficiary_receives_currency = $scope.currencyTo;
                $scope.widget.showDetails();
            } else {
                console.log('FAILURE:::' + data.data);
            }
        });
    };

    $scope.sendMoneyClick = function() {
        if ($scope.deliveryMethod === "ACCOUNTPAYMENT" || $scope.deliveryMethod === "CASHPICKUP" || $scope.deliveryMethod === "MOBILE_MONEY") {
            // amounts validation for regular transaction
            if (!$scope.amount && !$scope.receiving_amount) {
                message.open('error', 'Please insert sending or receiving amount.', '#msg-widget');
                jQuery('.widget').addClass('widget-error');
                return;
            }
        } else if ($scope.deliveryMethod === "AIRTIME_TOPUP") {
            if ($scope.TopUpAmount === '' || $scope.TopUpAmount === undefined || $scope.TopUpAmount === 'undefined') {
                message.open('error', 'Please select top-up amount.', '#msg-widget');
                return;
            }
        } else if ($scope.deliveryMethod === "WALLET") {
            if ($scope.walletAmount === '' || $scope.walletAmount === undefined || $scope.walletAmount === 'undefined') {
                message.open('error', 'Please select receiving wallet amount.', '#msg-widget');
                return;
            }
        }
        window.location.href = 'login';
    };

    $scope.clearPageSummary = function() {
        $scope.page_amount = '0.00';
        $scope.page_charges = '0.00';
        $scope.page_total_amount = '0.00';
        $scope.page_receiving_amount = '0.00';
    };

    $scope.calculate = function(isInverse) {
        if (isInverse === false) {
            if ($scope.amount === '0' || $scope.amount === '00' || $scope.amount === '000' || $scope.amount === '0000' || $scope.amount === '0.') {
                $scope.receiving_amount = '0.00';
                $scope.clearPageSummary();
                return;
            } else if ($scope.amount === '') {
                $scope.clearPageSummary();
            }
            var datas = {
                'data': {
                    'platform': 'web',
                    'amount': $scope.amount,
                    'delivery_method': $scope.deliveryMethod,
                    'currency_from': $scope.currencyFrom,
                    'currency_to': $scope.currencyTo,
                    'destination_country': $scope.destinationCountry,
                    'inverse': '' + isInverse,
                    'uuid': '000000',
                    'promo_code': ''
                }
            };
        } else if (isInverse === true) {
            if ($scope.receiving_amount === '0' || $scope.receiving_amount === '00' || $scope.receiving_amount === '000' || $scope.receiving_amount === '0000' || $scope.receiving_amount === '0.') {
                $scope.amount = '0.00';
                $scope.clearPageSummary();
                return;
            } else if ($scope.receiving_amount === '') {
                $scope.clearPageSummary();
            }
            var datas = {
                'data': {
                    'platform': 'web',
                    'receiving_amount': $scope.receiving_amount,
                    'delivery_method': $scope.deliveryMethod,
                    'currency_from': $scope.currencyFrom,
                    'currency_to': $scope.currencyTo,
                    'destination_country': $scope.destinationCountry,
                    'inverse': '' + isInverse,
                    'uuid': '000000',
                    'promo_code': ''
                }
            };
        }
        message.close();
        jQuery('.widget').removeClass('widget-error');
        if ($scope.amount === undefined && typeof $scope.amount === "undefined") {
            $scope.amount = '';
            return;
        }
        if ($scope.receiving_amount === undefined && typeof $scope.receiving_amount === "undefined") {
            $scope.receiving_amount = '';
        }
        Calculate.post(angular.toJson(datas), function(data) {
            console.log('isInverse:: ' + isInverse);
            console.log("Calculate::: " + angular.toJson(data));
            if (data.status === "SUCCESS") {
                if (typeof(Storage) !== "undefined") {
                    var draft_transaction = {
                        "destination_country": $scope.destinationCountry,
                        "sending_currency": $scope.currencyFrom,
                        "receiving_currency": $scope.currencyTo,
                        "amount": $scope.amount,
                        "receiving_amount": $scope.receiving_amount
                    };
                    sessionStorage.setItem('draft_transaction', JSON.stringify(draft_transaction));
                } else {
                    console.log("Sorry local/session storage is not supported in your browser.");
                }
                var receivingAmountForResponse = eval('data.data.receiving_amount_' + $scope.deliveryMethod);
                var sendingAmountForResponse = eval('data.data.amount_' + $scope.deliveryMethod);
                if (isInverse === false) {
                    $scope.receiving_amount = receivingAmountForResponse;
                } else if (isInverse === true) {
                    $scope.amount = sendingAmountForResponse;
                }

                $scope.page_amount = $scope.amount;
                $scope.page_sendingCurrency = $scope.currencyFrom;
                $scope.page_charges = eval('data.data.charges_' + $scope.deliveryMethod);
                $scope.page_charges_currency = $scope.currencyFrom;
                $scope.page_total_amount = eval('data.data.total_amount_' + $scope.deliveryMethod);
                $scope.page_total_amount_currency = $scope.currencyFrom;
                $scope.page_exchange_rate = eval('data.data.exchange_rate_' + $scope.deliveryMethod);
                $scope.page_beneficiary_receives_currency = $scope.currencyTo;
                $scope.page_receiving_amount = $scope.receiving_amount;

                $scope.datas = data;
                $scope.widget.showDetails();
            } else {
                $scope.datas = data;
                console.log("$scope.receiving_amount:: " + $scope.receiving_amount + " $scope.amount:: " + $scope.amount);
                $scope.amount = '';
                $scope.receiving_amount = '';
            }
        });
    };

    $scope.widget = {
        init: function() {
            this.$deliveryMethod = jQuery('#delivery-method');
            this.openedWidget;
            this.widgetOpen = false;
            this.widgetID;
            this.openedWidgetID;
            this.$transactionInfo = jQuery('.transaction-info');
            this.$widget = jQuery(".widget");
            this.$selectOperator = jQuery(".select-operator");
            this.$btn = jQuery(".btn");
            this.detailsOpen = false;
            this.selectedDeliveryMethod;
            this.typingTimer;
            this.$inputSending = jQuery('#send-amount');
            this.$inputReceiving = jQuery('#receiving-amount');
            this.$inputAirtime = jQuery('#airtime-input');
            this.$inputWallet = jQuery('#wallet-input');
            this.$walletAmount = jQuery('#wallet-amount');
            this.$phoneInput;
            this.airtimePhoneOpen = false;
            this.walletPhoneOpen = false;
            this.doneTypingInterval = 1500; // airtime and wallet time after which the phone is passed
            this.UIActions();
        },
        openWidget: function() {
            var focusOn;
            if ($scope.deliveryMethod === "ACCOUNTPAYMENT" || $scope.deliveryMethod === "CASHPICKUP" || $scope.deliveryMethod === "MOBILE_MONEY") {
                this.widgetID = "#money-transfer-container";
                focusOn = this.$inputSending;
            } else if ($scope.deliveryMethod === "AIRTIME_TOPUP") {
                this.widgetID = "#airtime-container";
                this.selectedDeliveryMethod = "airtime";
                this.findCountryCode();
                focusOn = this.$inputAirtime;
            } else if ($scope.deliveryMethod === "WALLET") {
                this.widgetID = "#wallet-container";
                this.selectedDeliveryMethod = "wallet";
                this.findCountryCode();
                focusOn = this.$inputWallet;
            }
            if (this.widgetID !== this.openedWidgetID) {
                if (this.widgetOpen === true) {
                    $(this.openedWidgetID).velocity("slideUp");
                }
                jQuery(this.widgetID).delay(250).velocity("slideDown", {
                    complete: function() {
                        focusOn.focus();
                    }
                });
                this.widgetOpen = true;
                this.openedWidgetID = this.widgetID;
            }
        },
        closeWidget: function() {
            jQuery(this.openedWidgetID).velocity("slideUp");
            this.openedWidgetID = '';
            this.widgetOpen = false;
        },
        numberNotFound: function() {
            // Accepts 'wallet' or 'airtime'
            jQuery('#' + this.selectedDeliveryMethod + '-container .widget-top-phone').velocity("callout.shake").addClass("number-not-recognized");
            jQuery('#' + this.selectedDeliveryMethod + '-label').text('Phone number not recognized, try again.');
        },
        numberFound: function() {
            // Accepts 'wallet' or 'airtime'
            jQuery('.widget-top-phone').removeClass("number-not-recognized");
            jQuery('#' + this.selectedDeliveryMethod + '-label').text('Phone number');
            if (this.selectedDeliveryMethod === "wallet") {
                jQuery('#wallet-container .widget-bottom-wallet').velocity("slideDown", { duration: 250 }, "ease-in-out");
            } else if (this.selectedDeliveryMethod === "airtime") {
                jQuery('#airtime-container .widget-bottom-phone').velocity("slideDown", { duration: 250 }, "ease-in-out");
                jQuery('#airtime-container .operator').velocity("fadeIn", { duration: 250 }, "ease-in-out");
                this.airtimePhoneOpen = true;
            }
            jQuery('#' + this.selectedDeliveryMethod + '-container .widget').delay(250).removeClass('widget-' + this.selectedDeliveryMethod + '-beneficiary').addClass('widget-' + this.selectedDeliveryMethod + '-number');
        },
        findCountryCode: function() {
            var result = $scope.countries.filter(function(obj) {
                return obj.name == $scope.destinationCountries[$scope.destinationCountry];
            });
            if ($scope.deliveryMethod === "AIRTIME_TOPUP") {
                $scope.airtimeNumber = result[0].telephone_code;
                $scope.prefixLength = result[0].telephone_code.length;
            } else if ($scope.deliveryMethod === "WALLET") {
                $scope.walletNumber = result[0].telephone_code;
            }
        },
        hideNumberInput: function() {
            if (this.selectedDeliveryMethod === "wallet") {
                $scope.walletNumber = '';
                $scope.walletAmount = '';
            } else if (this.selectedDeliveryMethod === "airtime" && this.airtimePhoneOpen === true) {
                jQuery('#airtime-container .operator').velocity("fadeOut", { duration: 250 }, "ease-in-out");
                jQuery('#airtime-container .widget-bottom-phone').velocity("slideUp", { duration: 250 }, "ease-in-out");
                this.airtimePhoneOpen = false;
            }
            jQuery('#' + this.selectedDeliveryMethod + '-container .widget').delay(250).removeClass('widget-' + this.selectedDeliveryMethod + '-number'); // removed because of border-bottom on airtime, but might be needed on wallet .addClass('widget-' + this.selectedDeliveryMethod + '-beneficiary');
        },
        showDetails: function() {
            if (this.detailsOpen === false) {
                this.$transactionInfo.velocity("slideDown");
                this.detailsOpen = true;
            }
        },
        hideDetails: function() {
            if (this.detailsOpen === true) {
                this.$transactionInfo.velocity("slideUp");
                this.detailsOpen = false;
            }
        },
        phoneListener: function() {
            this.$phoneInput = jQuery('#' + this.selectedDeliveryMethod + '-input');
            $scope.TopUpAmount = '';
            this.hideNumberInput();
            this.hideDetails();
            // if entered number length is shorter than 7 (excl. prefix) then don't procees it
            if ($scope.airtimeNumber.length > $scope.prefixLength + 7) {
                clearTimeout(this.typingTimer);
                if (this.$phoneInput.val()) {
                    this.typingTimer = setTimeout(this.doneTyping, this.doneTypingInterval);
                }
            }
        },
        doneTyping: function() {
            console.log('Passing phone number...');
            $scope.loading = 'loading';
            $scope.sendAirtimeNumber();
        },
        changeOperator: function() {
            this.$widget.velocity({ translateX: -500 }, 250);
            this.$selectOperator.velocity({ "opacity": 1 });
        },
        selectOperator: function() {
            this.$selectOperator.velocity({ "opacity": 0 });
            this.$widget.velocity({ translateX: 0 }, 250);
        },
        sendMoney: function() {
            this.$btn.toggleClass("working");
        },
        UIActions: function() {
            this.$inputSending.blur(function() {
                var amountToConvert = this.$inputSending.val();
                $scope.amount = this.convertDecimal(amountToConvert);
            }.bind(this));
            this.$inputReceiving.blur(function() {
                var amountToConvert = this.$inputReceiving.val();
                $scope.receiving_amount = this.convertDecimal(amountToConvert);
            }.bind(this));
            this.$walletAmount.blur(function() {
                console.log('wallet amount input blur');
                var amountToConvert = this.$walletAmount.val();
                $scope.walletAmount = this.convertDecimal(amountToConvert);
            }.bind(this));
        },
        convertDecimal: function(amount) {
            if (isNaN(parseFloat(amount))) {
                return;
            }
            amount = parseFloat(amount).toFixed(2);
            return amount;
        }
    };


    // on startup fire the fetch supported countries service
    $scope.countryListLoaded = false;
    $scope.fetchSupportedCountries();

    // select listeners
    $scope.destinationCountryChangeListener = function() {
        $scope.fetchSupportedDeliveryMethdods();
        $scope.widget.closeWidget();
        $scope.widget.hideDetails();
        $scope.amount = '';
        $scope.receiving_amount = '';
    };

    $scope.deliveryMethodChangeListener = function() {
        message.close();
        $scope.fetchSupportedSendingCurrencies();
        $scope.amount = '';
        $scope.receiving_amount = '';
        $scope.airtimeNumber = '';
        $scope.widget.hideNumberInput();
        $scope.widget.hideDetails();
        if ($scope.deliveryMethod !== undefined) {
            $scope.widget.openWidget();
        } else {
            $scope.widget.closeWidget();
        }
    };

    $scope.currencyFromListener = function() {
        $scope.fetchSupportedReceivingCurrencies();
    };

    $scope.airtimeTopupAmountListener = function() {
        $scope.airtimeCalculate();
    };

});



// Register the http services
app.factory('Calculate', function($resource) {
    var url = SERVICE_URL + 'calculator';
    var factory = $resource(url, {}, {
        post: {
            method: "POST",
            isArray: false
        }
    });
    return factory;
});

app.factory('SupportedCurrencies', function($resource) {
    var url = SERVICE_URL + 'supported-currencies';
    var factory = $resource(url, {}, {
        post: {
            method: "POST",
            isArray: false
        }
    });
    return factory;
});


app.factory('DeliveryMethods', function($resource) {
    var url = SERVICE_URL + 'supported-delivery-methods';
    var factory = $resource(url, {}, {
        post: {
            method: "POST",
            isArray: false
        }
    });
    return factory;
});

app.factory('DestinationCountries', function($resource) {
    var url = SERVICE_URL + 'supported-destination-countries';
    var factory = $resource(url, {}, {
        post: {
            method: "POST",
            isArray: false
        }
    });
    return factory;
});

//Airtime
app.factory('Airtime', function($resource) {
    var url = SERVICE_URL + 'pre-topup';
    var factory = $resource(url, {}, {
        post: {
            method: "POST",
            isArray: false
        }
    });
    return factory;
});

//Wallet supported currencies
app.factory('WalletSupportedCurrencies', function($resource) {
    var url = SERVICE_URL + 'supported-wallet-currencies';
    var factory = $resource(url, {}, {
        post: {
            method: "POST",
            isArray: false
        }
    });
    return factory;
});
