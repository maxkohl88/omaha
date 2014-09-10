app = angular.module 'create.controller', []

app.controller "CreatePlayCtrl", @CreatePlayCtrl = ($scope, $http) ->

  $scope.pageClass = 'page-create'

  $scope.field = Snap '.create-play-field'

  $scope.basicOffense = () ->

  $scope.basicDefense = () ->

  $scope.data = [
    id: 1
    play_name: "Default"
    play_type: "pass"
    player1_coordinates: [
      "M595 550",
      "595 640"
    ]
    player2_coordinates: [
      "M645 550",
      "645 620"
    ]
    player3_coordinates: [
      "M695 550",
      "695 600"
    ]
    player4_coordinates: [
      "M745 550",
      "745 620"
    ]
    player5_coordinates: [
      "M795 550",
      "795 640"
    ]
    player6_coordinates: [
      "M1195 550",
      "1195 200",
      "1170 225"
    ]
    player7_coordinates: [
      "M195 550",
      "195 375",
      "495 375"
    ]
    player8_coordinates: [
      "M995 550",
      "945 500",
      "945 0"
    ]
    player9_coordinates: [
      "M745 650",
      "1245 650",
      "1270 550"
    ]
    player10_coordinates: [
      "M545 550",
      "545 250",
      "795 250"
    ]
    player11_coordinates: [
      "M695 650",
      "695 650"
    ]
  ]

  console.log $scope.data

