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
  cx = 50
  cy = 50
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
    console.log(cx)
    cx += 50
    i++
                                              

