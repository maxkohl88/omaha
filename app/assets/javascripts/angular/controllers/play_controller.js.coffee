app = angular.module 'play.controller', []

app.controller 'PlayCtrl', @PlayCtrl = ($scope) ->
  $scope.name = "Let's Play"
