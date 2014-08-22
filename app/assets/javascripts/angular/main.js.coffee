app = angular.module 'omaha', ['templates', 'omaha.controllers', 'ngRoute']

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'dashboard.html',
    controller: 'HomeCtrl'
    ).when('/#/play',
    controller: 'PlayCtrl',
    templateUrl: 'app/views/play/index.html'
    ).otherwise redirectTo: '/']


