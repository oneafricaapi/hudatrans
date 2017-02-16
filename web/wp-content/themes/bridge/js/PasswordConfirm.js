loginApp.directive('validPassword', function () {
    return {
        require: 'ngModel',
        link: function (scope, elm, attrs, ctrl) {
            ctrl.$parsers.unshift(function (viewValue, $scope) {
                var noMatch = viewValue !== scope.frmUser.pwd1.$viewValue;
                ctrl.$setValidity('noMatch', !noMatch);
            });
        }
    };
});