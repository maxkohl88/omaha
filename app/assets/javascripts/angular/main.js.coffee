app = angular.module 'omaha', ['templates', 'omaha.controllers', 'ngRoute', 'ngAnimate']

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'homepage.html',
    controller: 'HomeCtrl'
  ).when('/play',
    templateUrl: 'play.html',
    controller: 'PlayCtrl'
  ).otherwise redirectTo: '/']


app.factory 'snapFactory', @snapFactory = () ->
  service = {}
  
  service.wrapPage = () ->
    'butts'
