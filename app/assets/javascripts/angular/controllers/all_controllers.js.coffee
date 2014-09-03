omahaControllers = angular.module 'omaha.controllers', ['home.controller']

omahaControllers.controller 'PlayCtrl',['$scope',
'Route'
($scope, Route) ->

  $scope.pageClass = 'page-play'

  playCoordinates =
    offense1:
      position: 'wr1'
      coordinates: ["M1195 550", "1195 200", "1170 225"]
    offense2:
      position: 'wr2'
      coordinates: ["M195 550", "195 375", "495 375"]
  

  console.log playCoordinates 

  # set a scoped reference to the field as 'field'

  $scope.field = Snap ('#football-field')
  # initiate an empty array for the offensive players and set a scoped reference
  # to it as 'offense'

  # wr1Path = new Route $scope.field, wr1Coordinates
  # wr2Path = new Route $scope.field, wr2Coordinates
]

