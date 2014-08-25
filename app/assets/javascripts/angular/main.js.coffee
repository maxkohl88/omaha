app = angular.module 'omaha', ['templates', 'omaha.controllers', 'ngRoute']

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'homepage.html',
    controller: 'HomeCtrl'
  ).when('/play',
    templateUrl: 'play.html',
    controller: 'PlayCtrl'
  ).otherwise redirectTo: '/']


