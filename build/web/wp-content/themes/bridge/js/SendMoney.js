var app = angular.module('myApp', []);
app.controller('SendMoney', ['$scope', '$http', function ($scope, $http) {
        init();
        function init() {
            $scope.calHide = true;
            $scope.transInfoTest=false;
            $http({
                method: 'GET',
                url: 'webresources/country/countries'
            }).then(function (resp) {
                console.log(resp.data);
                $scope.countries = resp.data;
            });
        }
        $scope.destinationCountryChangeListener = function()
        {
            $http({
                method: 'GET',
                url: 'webresources/country/methods'
            }).then(function (resp) {
                console.log(resp.data);
                $scope.methods = resp.data;
            });
        };
        
        $scope.deliveryMethodChangeListener = function()
        {
            $scope.calHide=false;
            //$scope.currencyFrom = $scope.destinationCountry;
            $http({
                method:"GET",
                url: 'webresources/country/getEngland'
            }).then(function(response){
                $scope.fromCountries = response.data;
                $scope.currencyFrom = response.data[0].currency;
            });
            $scope.currencyTo = $scope.destinationCountry;
            $scope.countryData =  $scope.destinationCountry;
        };
        
        $scope.calculate = function(test)
        {
            if(!test)
            {
                 
                if($scope.currencyFrom === undefined)
                    return;
                var amount = $scope.amount;
//                var rate = $scope.currencyFrom.rate;
                var rateTo = $scope.currencyTo.rate;
                //var re = amountrate;
                var total = amount * rateTo;
                $scope.receiving_amount = total;
                $scope.fee = $scope.countryData.static_fee +(($scope.countryData.dynamic_fee/100)*$scope.amount);
                console.log(total);
            }
            else
            {
                if($scope.currencyTo === undefined)
                    return;
                var amount = $scope.receiving_amount;
//                var rate = $scope.currencyFrom.rate;
                var rateTo = $scope.currencyTo.rate;
                var total = amount/rateTo;
                $scope.fee = $scope.countryData.static_fee +(($scope.countryData.dynamic_fee/100)*$scope.amount);
                //var total = re * rateTo;
                $scope.amount = total;
                console.log(total);
            }
            $scope.transInfoTest=true;
        };
        
        $scope.sendMoneyClick = function()
        {
            var data = {amountPound:$scope.amount, amountDest:$scope.receiving_amount,fee:$scope.fee, method:$scope.deliveryMethod };
            $http({
                method:'POST',
                url:'webresources/country/PreTrans',
                header:{
                    'Content-Type':'application/json'
                },
                data:angular.toJson(data)
            }).then(function(resp){
                if(resp.data.stage === 'LOGIN'){
                    window.location = 'login/index.html';
                }
                else if(resp.data.stage === 'BENE')
                {
                    window.location = 'beneficiary/existing.html';
                }
                else
                {
                    
                }
            });
        };
    }]);
app.controller('UserController',['$http','$scope',function($http,$scope){
      init();
      function init()
      {
          $scope.data = {};
          $scope.bene = {};
          $scope.step1 = true;
          $scope.step2 = false;
          $http({
                method: 'GET',
                url: '../webresources/country/countries'
            }).then(function (resp) {
                console.log(resp.data);
                $scope.countries = resp.data;
            });
      }
      
      $scope.signIp_step2 = function()
      {
           $scope.step1 = false;
           $scope.step2 = true;
      };
      
      $scope.signIp_step1 = function()
      {
           $scope.step1 = true;
           $scope.step2 = false;
      };
      
      $scope.createUser = function()
      {
          $http({
              method: 'POST',
              url: '../webresources/country/saveUser',
              header:{
                  'Content-Type':'application/json'
              },
              data: angular.toJson($scope.data)
          }).then(function(resp){
              if(resp.data === "SUCCESS")
              {
                  window.location = '../login/index.html';
              }
          });
      };
      //getBene();
      $scope.addBene = function()
      {
          $http({
              method: 'POST',
              url: '../webresources/country/addBene',
              header:{
                  'Content-Type':'application/json'
              },
              data: angular.toJson($scope.bene)
          }).then(function(resp){
              if(resp.data === "SUCCESS")
              {
                  window.location = 'existing.html';
              }
              else{
                  window.location = '../login/index.html';
              }
          });
      };
      
      $scope.destinationCountryChangeListener = function(country)
      {
          $http({
              method: 'POST',
              url: '../webresources/country/getBank',
              header:{
                  'Content-Type':'application/json'
              },
              data: angular.toJson(country)
          }).then(function(resp){
              $scope.banks = resp.data;
          });
      };
      
}]);

app.controller('BeneController',['$scope','$http',function($scope,$http){
        init();
        function init(){
            $http({
              method:'GET',
              url: '../webresources/country/getBene'
          }).then(function(resp){
              $scope.beneficiaries = resp.data;
          });
        }
        
        $scope.makePayment = function(beneficiary)
        {
            $http({
                method:'POST',
                url: '../webresources/country/postTran',
                header:{
                    'Content-Type':'application/json'
                },
                data:angular.toJson(beneficiary)
            }).then(function(resp){
                if(resp.data === 'SUCCESS'){
                    alert("Payment successful");
                    window.location = '../home/home.html';
                }
                else
                {
                    window.location = '../login/index.html';
                }
            });
        };
}]);

app.controller('NavController',['$scope','$http',function($scope,$http){
    $scope.navigate = function(){
        $http({
            method:'GET',
            url:'/HudaTran/webresources/country/navTest'
        }).then(function(resp){
            if(resp.data === 'LOGIN')
            {
                window.location = '/HudaTran/login/index.html';
            }
            else{
                window.location = '/HudaTran/home/home.html';
            }
        });
    };    
}]);

app.controller('LoginCtrl',['$scope','$http',function($scope,$http){
    init();
    function init()
    {
        $scope.data = {};
        $scope.beneChange = true;
    }
    
    $scope.login = function(){
        $http({
            method:'POST',
            url: '../webresources/country/login',
            header: {
                'Content-Type':'application/json'
            },
            data:angular.toJson($scope.data)
        }).then(function(resp){
           if(resp.data === "SUCCESS")
           {
               console.log(resp.data);
                window.location = '../index.html';
           }
           else if(resp.data === "NAV"){
               window.location = '../home/home.html';
           }
           else if(resp.data === "BENEFICIARY")
           {
               window.location = '../beneficiary/existing.html';
           }
           else
           {
               window.location = '../login/error.html';
           }
        });
    };
    $scope.destinationBeneficiaryChangeListener = function()
    {
        $scope.beneChange = false;
    };
}]);

app.controller('HomeController',['$scope','$http',function($scope, $http){
        init();
        function init()
        {
            $http({
                method:'GET',
                url:'../webresources/country/transactions'
            }).then(function(resp){
                $scope.transactions = resp.data;
            });
        }
}]);
   

