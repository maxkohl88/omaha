app = angular.module 'play.controller', []

app.controller 'PlayCtrl', @PlayCtrl = ($scope) ->
  $scope.name = "Let's Play"

  $scope.field = Snap ('#football-field')

  field = $scope.field

  # $scope.x1 = field.text(50, 50, 'X')
  # $scope.x1.attr(
  #   fill: 'white',
  #   fontSize: '48'
  # )

  $scope.offense = []

  i = 0
  cx = 0
  cy = 0
  while i < 11
    fill = "white"
    fontSize = "48"
    player = field.text(cx, cy, "X")
    player.attr
      fill: fill
      fontSize: fontSize

    player.data "xOffset", cx
    player.data "cx", cx
    player.data "yOffset", cy
    player.data "cy", cy
    $scope.offense.push player
    i++

  # QB
  $scope.offense[0].transform('T600, 600')
  # LT
  $scope.offense[1].transform('T500, 550')
  # LG
  $scope.offense[2].transform('T550, 550')
  # C
  $scope.offense[3].transform('T600, 550')
  # RG
  $scope.offense[4].transform('T650, 550')
  # RT
  $scope.offense[5].transform('T700, 550')
  # RB
  $scope.offense[6].transform('T600, 700')
  # TE
  $scope.offense[7].transform('T450, 550')
  # WR1
  $scope.offense[8].transform('T1100, 550')
  # WR2
  $scope.offense[9].transform('T100, 550')
  # WR3
  $scope.offense[10].transform('T900, 550')


