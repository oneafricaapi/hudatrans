// var BASE_URL =   "http://localhost:8080/";
// var SERVICE_URL =  "http://localhost:8080/web-services/widgets/v2/";
// var API_SERVICE_URL = "http://localhost:8080/web-services/api/v4/services/";

var BASE_URL =   "https://www.imperialfxexpress.co.uk/";
var SERVICE_URL =  "https://www.imperialfxexpress.co.uk/web-services/widgets/v2/";
var API_SERVICE_URL = "https://www.imperialfxexpress.co.uk/web-services/api/v4/services/";





function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
