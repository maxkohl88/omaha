app = angular.module 'omaha', ['templates', 'omaha.controllers', 'ngRoute', 'ngAnimate', 'playPageServices']

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'homepage.html',
    controller: 'HomeCtrl'
  ).when('/play',
    templateUrl: 'play.html',
    controller: 'PlayCtrl'
  ).when('/create',
    templateUrl: 'create.html',
    controller: 'CreatePlayCtrl'
  ).otherwise redirectTo: '/']

  
