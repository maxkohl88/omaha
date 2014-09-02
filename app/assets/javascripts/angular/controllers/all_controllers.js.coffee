omahaControllers = angular.module 'omaha.controllers', ['home.controller']

omahaControllers.controller 'PlayCtrl',['$scope',
'Route',
($scope, Route) ->

  $scope.pageClass = 'page-play'

  wr1Coordinates = ["M1195 550", "1195 200", "1170 225"]

  # set a scoped reference to the field as 'field'

  $scope.field = Snap ('#football-field')
  # initiate an empty array for the offensive players and set a scoped reference
  # to it as 'offense'

  wr1Path = new Route $scope.field, wr1Coordinates

  console.log wr1Path

]

