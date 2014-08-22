app = angular.module 'omaha.controllers', []

app.controller "HomeCtrl", @HomeCtrl = ($scope) ->
  $scope.name = "Omaha!"
  $scope.learn = "Learn"
  $scope.play = "Play"
