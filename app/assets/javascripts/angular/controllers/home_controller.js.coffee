app = angular.module 'home.controller', []

app.controller "HomeCtrl", @HomeCtrl = ($scope) ->
  $scope.name = "Omaha!"
  $scope.learn = "Learn"
  $scope.play = "Play"
