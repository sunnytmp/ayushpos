var app = angular.module('app', []);
app.controller('MainCtrl', function($scope) {
  $scope.name = 'World';
  $scope.noHrefTest = function () { 
  var con = document.getElementById('content')
   ,   xhr = new XMLHttpRequest();

   xhr.onreadystatechange = function (e) { 
    if (xhr.readyState == 4 && xhr.status == 200) {
     con.innerHTML = xhr.responseText;
    }
   }
  
  xhr.open("GET", "index.html", true);
 xhr.setRequestHeader('Content-type', 'text/html');
 xhr.send();
  // alert('woot!') };
  };
});