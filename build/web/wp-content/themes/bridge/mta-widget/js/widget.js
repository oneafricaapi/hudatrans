// Error/Success/Info message function. type = error/success/info id = particular msg we want to target example: message("info", "siemaneczko", "")

var openMessage = false;
var previousID;
var message = {
    open: function(type, messageText, id) {
        var msgClass;
        jQuery('.msg' + id).html(messageText);
        jQuery('.msg' + id).removeClass("msg-error msg-success msg-info").addClass(msgClass = "msg-" + type);
        if (previousID != id || openMessage !== true) {
            console.log('openMessage state:: ' + openMessage);
            jQuery('.msg' + id).velocity("slideDown", { duration: 125 });
            jQuery('.msg' + id).velocity({ "opacity": 1, duration: 125 });
        }
        jQuery('.msg' + id).velocity("scroll", { duration: 250, offset: -35 });
        openMessage = true;
        previousID = id;
    },
    close: function() {
        if (openMessage === true) {
            jQuery('.msg').velocity({ "opacity": 0, duration: 125 });
            jQuery('.msg').velocity("slideUp", { duration: 125 });
            openMessage = false;
        }
    }
}
