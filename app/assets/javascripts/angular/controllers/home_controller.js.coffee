app = angular.module 'home.controller', []

app.controller "HomeCtrl", @HomeCtrl = ($scope) ->
  $scope.pageClass = 'page-home'
  $scope.name = "Omaha!"
  $scope.learn = "Learn"
  $scope.play = "Play"
  $scope.create = "Create"
