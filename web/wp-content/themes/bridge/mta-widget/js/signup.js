var app = angular.module('myApp', ['ngResource']);

app.controller('myCtrl', function($scope, CrudResource) {
    var countries = [{ "name": "Abkhazia", "telephone_code": "+995" }, { "name": "Afghanistan", "telephone_code": "+93" }, { "name": "Aland", "telephone_code": "+358-18" }, { "name": "Albania", "telephone_code": "+355" }, { "name": "Algeria", "telephone_code": "+213" }, { "name": "American Samoa", "telephone_code": "+1-684" }, { "name": "Andorra", "telephone_code": "+376" }, { "name": "Angola", "telephone_code": "+244" }, { "name": "Anguilla", "telephone_code": "+1-264" }, { "name": "Antarctica", "telephone_code": "" }, { "name": "Antigua and Barbuda", "telephone_code": "+1-268" }, { "name": "Argentina", "telephone_code": "+54" }, { "name": "Armenia", "telephone_code": "+374" }, { "name": "Aruba", "telephone_code": "+297" }, { "name": "Ascension", "telephone_code": "+247" }, { "name": "Ashmore and Cartier Islands", "telephone_code": "" }, { "name": "Australia", "telephone_code": "+61" }, { "name": "Australian Antarctic Territory", "telephone_code": "" }, { "name": "Austria", "telephone_code": "+43" }, { "name": "Azerbaijan", "telephone_code": "+994" }, { "name": "Bahamas", "telephone_code": "+1-242" }, { "name": "Bahrain", "telephone_code": "+973" }, { "name": "Baker Island", "telephone_code": "" }, { "name": "Bangladesh", "telephone_code": "+880" }, { "name": "Barbados", "telephone_code": "+1-246" }, { "name": "Belarus", "telephone_code": "+375" }, { "name": "Belgium", "telephone_code": "+32" }, { "name": "Belize", "telephone_code": "+501" }, { "name": "Benin", "telephone_code": "+229" }, { "name": "Bermuda", "telephone_code": "+1-441" }, { "name": "Bhutan", "telephone_code": "+975" }, { "name": "Bolivia", "telephone_code": "+591" }, { "name": "Bosnia and Herzegovina", "telephone_code": "+387" }, { "name": "Botswana", "telephone_code": "+267" }, { "name": "Bouvet Island", "telephone_code": "" }, { "name": "Brazil", "telephone_code": "+55" }, { "name": "British Antarctic Territory", "telephone_code": "" }, { "name": "British Indian Ocean Territory", "telephone_code": "+246" }, { "name": "British Sovereign Base Areas", "telephone_code": "+357" }, { "name": "British Virgin Islands", "telephone_code": "+1-284" }, { "name": "Brunei", "telephone_code": "+673" }, { "name": "Bulgaria", "telephone_code": "+359" }, { "name": "Burkina Faso", "telephone_code": "+226" }, { "name": "Burundi", "telephone_code": "+257" }, { "name": "Cambodia", "telephone_code": "+855" }, { "name": "Cameroon", "telephone_code": "+237" }, { "name": "Canada", "telephone_code": "+1" }, { "name": "Cape Verde", "telephone_code": "+238" }, { "name": "Cayman Islands", "telephone_code": "+1-345" }, { "name": "Central African Republic", "telephone_code": "+236" }, { "name": "Chad", "telephone_code": "+235" }, { "name": "Chile", "telephone_code": "+56" }, { "name": "China", "telephone_code": "+86" }, { "name": "Christmas Island", "telephone_code": "+61" }, { "name": "Clipperton Island", "telephone_code": "" }, { "name": "Cocos (Keeling) Islands", "telephone_code": "+61" }, { "name": "Colombia", "telephone_code": "+57" }, { "name": "Comoros", "telephone_code": "+269" }, { "name": "Congo", "telephone_code": "+242" }, { "name": "Cook Islands", "telephone_code": "+682" }, { "name": "Coral Sea Islands", "telephone_code": "" }, { "name": "Costa Rica", "telephone_code": "+506" }, { "name": "Croatia", "telephone_code": "+385" }, { "name": "Cuba", "telephone_code": "+53" }, { "name": "Cyprus", "telephone_code": "+357" }, { "name": "Czech Republic", "telephone_code": "+420" }, { "name": "Democratic Republic of the Congo", "telephone_code": "+243" }, { "name": "Denmark", "telephone_code": "+45" }, { "name": "Djibouti", "telephone_code": "+253" }, { "name": "Dominica", "telephone_code": "+1-767" }, { "name": "Dominican Republic", "telephone_code": "+1-809 and 1-829" }, { "name": "Ecuador", "telephone_code": "+593" }, { "name": "Egypt", "telephone_code": "+20" }, { "name": "El Salvador", "telephone_code": "+503" }, { "name": "Equatorial Guinea", "telephone_code": "+240" }, { "name": "Eritrea", "telephone_code": "+291" }, { "name": "Estonia", "telephone_code": "+372" }, { "name": "Ethiopia", "telephone_code": "+251" }, { "name": "Falkland Islands (Islas Malvinas)", "telephone_code": "+500" }, { "name": "Faroe Islands", "telephone_code": "+298" }, { "name": "Fiji", "telephone_code": "+679" }, { "name": "Finland", "telephone_code": "+358" }, { "name": "France", "telephone_code": "+33" }, { "name": "French Guiana", "telephone_code": "+594" }, { "name": "French Polynesia", "telephone_code": "+689" }, { "name": "French Southern and Antarctic Lands", "telephone_code": "" }, { "name": "Gabon", "telephone_code": "+241" }, { "name": "Gambia", "telephone_code": "+220" }, { "name": "Georgia", "telephone_code": "+995" }, { "name": "Germany", "telephone_code": "+49" }, { "name": "Ghana", "telephone_code": "+233" }, { "name": "Gibraltar", "telephone_code": "+350" }, { "name": "Greece", "telephone_code": "+30" }, { "name": "Greenland", "telephone_code": "+299" }, { "name": "Grenada", "telephone_code": "+1-473" }, { "name": "Guadeloupe", "telephone_code": "+590" }, { "name": "Guam", "telephone_code": "+1-671" }, { "name": "Guatemala", "telephone_code": "+502" }, { "name": "Guernsey", "telephone_code": "+44" }, { "name": "Guinea", "telephone_code": "+224" }, { "name": "Guinea Bissau", "telephone_code": "+245" }, { "name": "Guyana", "telephone_code": "+592" }, { "name": "Haiti", "telephone_code": "+509" }, { "name": "Heard Island and McDonald Islands", "telephone_code": "" }, { "name": "Honduras", "telephone_code": "+504" }, { "name": "Hong Kong", "telephone_code": "+852" }, { "name": "Howland Island", "telephone_code": "" }, { "name": "Hungary", "telephone_code": "+36" }, { "name": "Iceland", "telephone_code": "+354" }, { "name": "India", "telephone_code": "+91" }, { "name": "Indonesia", "telephone_code": "+62" }, { "name": "Iran", "telephone_code": "+98" }, { "name": "Iraq", "telephone_code": "+964" }, { "name": "Ireland", "telephone_code": "+353" }, { "name": "Isle of Man", "telephone_code": "+44" }, { "name": "Israel", "telephone_code": "+972" }, { "name": "Italy", "telephone_code": "+39" }, { "name": "Ivory Coast", "telephone_code": "+225" }, { "name": "Jamaica", "telephone_code": "+1-876" }, { "name": "Japan", "telephone_code": "+81" }, { "name": "Jarvis Island", "telephone_code": "" }, { "name": "Jersey", "telephone_code": "+44" }, { "name": "Johnston Atoll", "telephone_code": "" }, { "name": "Jordan", "telephone_code": "+962" }, { "name": "Kazakhstan", "telephone_code": "+7" }, { "name": "Kenya", "telephone_code": "+254" }, { "name": "Kingman Reef", "telephone_code": "" }, { "name": "Kiribati", "telephone_code": "+686" }, { "name": "Kosovo", "telephone_code": "+381" }, { "name": "Kuwait", "telephone_code": "+965" }, { "name": "Kyrgyzstan", "telephone_code": "+996" }, { "name": "Laos", "telephone_code": "+856" }, { "name": "Latvia", "telephone_code": "+371" }, { "name": "Lebanon", "telephone_code": "+961" }, { "name": "Lesotho", "telephone_code": "+266" }, { "name": "Liberia", "telephone_code": "+231" }, { "name": "Libya", "telephone_code": "+218" }, { "name": "Liechtenstein", "telephone_code": "+423" }, { "name": "Lithuania", "telephone_code": "+370" }, { "name": "Luxembourg", "telephone_code": "+352" }, { "name": "Macau", "telephone_code": "+853" }, { "name": "Macedonia", "telephone_code": "+389" }, { "name": "Madagascar", "telephone_code": "+261" }, { "name": "Malawi", "telephone_code": "+265" }, { "name": "Malaysia", "telephone_code": "+60" }, { "name": "Maldives", "telephone_code": "+960" }, { "name": "Mali", "telephone_code": "+223" }, { "name": "Malta", "telephone_code": "+356" }, { "name": "Marshall Islands", "telephone_code": "+692" }, { "name": "Martinique", "telephone_code": "+596" }, { "name": "Mauritania", "telephone_code": "+222" }, { "name": "Mauritius", "telephone_code": "+230" }, { "name": "Mayotte", "telephone_code": "+262" }, { "name": "Mexico", "telephone_code": "+52" }, { "name": "Micronesia", "telephone_code": "+691" }, { "name": "Midway Islands", "telephone_code": "" }, { "name": "Moldova", "telephone_code": "+373" }, { "name": "Monaco", "telephone_code": "+377" }, { "name": "Mongolia", "telephone_code": "+976" }, { "name": "Montenegro", "telephone_code": "+382" }, { "name": "Montserrat", "telephone_code": "+1-664" }, { "name": "Morocco", "telephone_code": "+212" }, { "name": "Mozambique", "telephone_code": "+258" }, { "name": "Myanmar", "telephone_code": "+95" }, { "name": "Nagorno-Karabakh", "telephone_code": "+374-97" }, { "name": "Namibia", "telephone_code": "+264" }, { "name": "Nauru", "telephone_code": "+674" }, { "name": "Navassa Island", "telephone_code": "" }, { "name": "Nepal", "telephone_code": "+977" }, { "name": "Netherlands", "telephone_code": "+31" }, { "name": "Netherlands Antilles", "telephone_code": "+599" }, { "name": "New Caledonia", "telephone_code": "+687" }, { "name": "New Zealand", "telephone_code": "+64" }, { "name": "Nicaragua", "telephone_code": "+505" }, { "name": "Niger", "telephone_code": "+227" }, { "name": "Nigeria", "telephone_code": "+234" }, { "name": "Niue", "telephone_code": "+683" }, { "name": "Norfolk Island", "telephone_code": "+672" }, { "name": "Northern Cyprus", "telephone_code": "+90-392" }, { "name": "Northern Mariana Islands", "telephone_code": "+1-670" }, { "name": "North Korea", "telephone_code": "+850" }, { "name": "Norway", "telephone_code": "+47" }, { "name": "Oman", "telephone_code": "+968" }, { "name": "Pakistan", "telephone_code": "+92" }, { "name": "Palau", "telephone_code": "+680" }, { "name": "Palestine", "telephone_code": "+970" }, { "name": "Palmyra Atoll", "telephone_code": "" }, { "name": "Panama", "telephone_code": "+507" }, { "name": "Papua New Guinea", "telephone_code": "+675" }, { "name": "Paraguay", "telephone_code": "+595" }, { "name": "Peru", "telephone_code": "+51" }, { "name": "Peter I Island", "telephone_code": "" }, { "name": "Philippines", "telephone_code": "+63" }, { "name": "Pitcairn Islands", "telephone_code": "" }, { "name": "Poland", "telephone_code": "+48" }, { "name": "Portugal", "telephone_code": "+351" }, { "name": "Pridnestrovie (Transnistria)", "telephone_code": "+373-533" }, { "name": "Puerto Rico", "telephone_code": "+1-787 and 1-939" }, { "name": "Qatar", "telephone_code": "+974" }, { "name": "Queen Maud Land", "telephone_code": "" }, { "name": "Reunion", "telephone_code": "+262" }, { "name": "Romania", "telephone_code": "+40" }, { "name": "Ross Dependency", "telephone_code": "" }, { "name": "Russia", "telephone_code": "+7" }, { "name": "Rwanda", "telephone_code": "+250" }, { "name": "Saint Barthelemy", "telephone_code": "+590" }, { "name": "Saint Helena", "telephone_code": "+290" }, { "name": "Saint Martin", "telephone_code": "+590" }, { "name": "Saint Pierre and Miquelon", "telephone_code": "+508" }, { "name": "Samoa", "telephone_code": "+685" }, { "name": "San Marino", "telephone_code": "+378" }, { "name": "Sao Tome and Principe", "telephone_code": "+239" }, { "name": "Saudi Arabia", "telephone_code": "+966" }, { "name": "Senegal", "telephone_code": "+221" }, { "name": "Serbia", "telephone_code": "+381" }, { "name": "Seychelles", "telephone_code": "+248" }, { "name": "Sierra Leone", "telephone_code": "+232" }, { "name": "Singapore", "telephone_code": "+65" }, { "name": "Slovakia", "telephone_code": "+421" }, { "name": "Slovenia", "telephone_code": "+386" }, { "name": "Solomon Islands", "telephone_code": "+677" }, { "name": "Somalia", "telephone_code": "+252" }, { "name": "Somaliland", "telephone_code": "+252" }, { "name": "South Africa", "telephone_code": "+27" }, { "name": "South Georgia and the South Sandwich Islands", "telephone_code": "" }, { "name": "South Korea", "telephone_code": "+82" }, { "name": "South Ossetia", "telephone_code": "+995" }, { "name": "Spain", "telephone_code": "+34" }, { "name": "Sri Lanka", "telephone_code": "+94" }, { "name": "St Kitts and Nevis", "telephone_code": "+1-869" }, { "name": "St Lucia", "telephone_code": "+1-758" }, { "name": "St Vincent Grenadines", "telephone_code": "+1-784" }, { "name": "Sudan", "telephone_code": "+249" }, { "name": "Suriname", "telephone_code": "+597" }, { "name": "Svalbard", "telephone_code": "+47" }, { "name": "Swaziland", "telephone_code": "+268" }, { "name": "Sweden", "telephone_code": "+46" }, { "name": "Switzerland", "telephone_code": "+41" }, { "name": "Syria", "telephone_code": "+963" }, { "name": "Taiwan", "telephone_code": "+886" }, { "name": "Tajikistan", "telephone_code": "+992" }, { "name": "Tanzania", "telephone_code": "+255" }, { "name": "Thailand", "telephone_code": "+66" }, { "name": "Timor-Leste (East Timor)", "telephone_code": "+670" }, { "name": "Togo", "telephone_code": "+228" }, { "name": "Tokelau", "telephone_code": "+690" }, { "name": "Tonga", "telephone_code": "+676" }, { "name": "Trinidad and Tobago", "telephone_code": "+1-868" }, { "name": "Tristan da Cunha", "telephone_code": "+290" }, { "name": "Tunisia", "telephone_code": "+216" }, { "name": "Turkey", "telephone_code": "+90" }, { "name": "Turkmenistan", "telephone_code": "+993" }, { "name": "Turks and Caicos", "telephone_code": "+1-649" }, { "name": "Tuvalu", "telephone_code": "+688" }, { "name": "Uganda", "telephone_code": "+256" }, { "name": "Ukraine", "telephone_code": "+380" }, { "name": "United Arab Emirates", "telephone_code": "+971" }, { "name": "United Kingdom", "telephone_code": "+44" }, { "name": "United States", "telephone_code": "+1" }, { "name": "Uruguay", "telephone_code": "+598" }, { "name": "U.S. Virgin Islands", "telephone_code": "+1-340" }, { "name": "Uzbekistan", "telephone_code": "+998" }, { "name": "Vanuatu", "telephone_code": "+678" }, { "name": "Vatican City", "telephone_code": "+379" }, { "name": "Venezuela", "telephone_code": "+58" }, { "name": "Vietnam", "telephone_code": "+84" }, { "name": "Wake Island", "telephone_code": "" }, { "name": "Wallis and Futuna", "telephone_code": "+681" }, { "name": "Western Sahara", "telephone_code": "+212" }, { "name": "Yemen", "telephone_code": "+967" }, { "name": "Zambia", "telephone_code": "+260" }, { "name": "Zimbabwe", "telephone_code": "+263" }];

    $scope.countries = countries;

    $scope.countryChangeListener = function() {
        $scope.data.country_calling_code = $scope.countryList.telephone_code;
        $scope.data.country = $scope.countryList.name;
    }

    $scope.isSuccesful = function() {
        var datas = {};
        datas.data = $scope.data;
        console.log("request data: " + angular.toJson(datas));
        CrudResource.post(angular.toJson(datas), function(data) {
            console.log("response data: " + angular.toJson(datas));
            console.log(angular.toJson(data));
            if (data.status === "SUCCESS") {
                jQuery("#email").val($scope.data.email);
                jQuery("#password").val($scope.data.password);
                sessionStorage.removeItem('draft_transaction'); // clear the cache
                jQuery("#login-form").submit();
            } else {
                $scope.datas = data;
                console.log(data.message);
                message.open('error', data.message, '.msg');
            }
        });
    };
});
app.factory('CrudResource', function($resource) {
    var url = SERVICE_URL + 'customer-registration';

    var factory = $resource(url, {}, {
        post: {
            method: "POST",
            isArray: false
        }
    });
    return factory;
});

function setupForm() {
    if (typeof(Storage) !== "undefined") {
        var draft_transaction = JSON.parse(sessionStorage.getItem('draft_transaction'));
        console.log("Draft transaction:: " + draft_transaction);
        if (draft_transaction != null) {
            jQuery("#action").val("send_money");
            jQuery("#destination_country").val(draft_transaction.destination_country);
            jQuery("#sending_currency").val(draft_transaction.sending_currency);
            jQuery("#receiving_currency").val(draft_transaction.receiving_currency);
            jQuery("#send_amount").val(draft_transaction.amount);
            jQuery("#receiving_amount").val(draft_transaction.receiving_amount);
            //                    sessionStorage.removeItem('draft_transaction'); // clear the cache
        }
    } else {
        console.log("Sorry local/session storage is not supported in your browser.");
    }
    jQuery("#login-form").attr("action", BASE_URL + "external_login");
}

// Flag container template
function formatState(state) {
    if (!state.id) {
        return state.text;
    }
    var $state = jQuery(
        '<span><img src="http://46.101.28.57/flags/' + state.element.value + '.png" class="img-flag" /> ' + '</span>' + '<span class="text">' + state.text + '</span>'
    );
    return $state;
}

var signup = {
    init: function() {
        this.$signUpStep1 = jQuery('#signup-step1');
        this.$signUpStep2 = jQuery('#signup-step2');
        this.$firstName = jQuery("#first-name");
        this.$emailInput = jQuery("#email-signup");
        this.$passwordInput = jQuery("#password-signup");
        this.$passwordConfirmInput = jQuery("#password-confirm");
        this.$emailInput.focus();
    },
    step2: function() {
        if (this.$emailInput.val() === '') {
            message.open('error', 'Please enter a valid email address.', '.msg');
            return;
        }
        if (this.$passwordInput.val() === '') {
            message.open('error', 'Please enter a valid password.', '.msg');
            return;
        }
        if (this.$passwordConfirmInput.val() === '') {
            message.open('error', 'Please confirm your password.', '.msg');
            return;
        }
        if (this.$passwordInput.val() !== this.$passwordConfirmInput.val()) {
            message.open('error', "Passwords don't match.", '.msg');
            return;
        }

        message.close();
        this.$signUpStep1.velocity("fadeOut", 250);
        this.$signUpStep2.delay(250).velocity("fadeIn", 250);
        this.$firstName.delay(500).blur();
    },
    cancel: function() {
        location.reload();
    },
    return: function() {
        message.close();
        this.$signUpStep2.velocity("fadeOut", 250);
        this.$signUpStep1.delay(250).velocity("fadeIn", 250);
        this.$emailInput.delay(500).blur();
    }
}

/// mine
jQuery(document).ready(function() {
    var messageFromServer = getParameterByName("message");
    if (messageFromServer != '') {
        console.log(messageFromServer);
        message.open('error', messageFromServer, '.msg');
    }
    setupForm();
    jQuery('.flag-container select').select2({
        templateResult: formatState,
        templateSelection: formatState,
        placeholder: "Select country..."
    });
    signup.init();
});
