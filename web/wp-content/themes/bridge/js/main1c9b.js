var BASE_URL = "https://imperialfxexpress.co.uk/"; // "http://localhost:8080/";
var SERVICE_URL = "https://imperialfxexpress.co.uk/web-services/widgets/"; // "http://localhost:8080/web-services/widgets/";
var API_SERVICE_URL = "https://imperialfxexpress.co.uk/web-services/api/v1/services/"; // "http://localhost:8080/web-services/api/v1/services/";

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
