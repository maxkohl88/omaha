app = angular.module 'play.controller', []

app.controller 'PlayCtrl', @PlayCtrl = ($scope) ->

  # wrap a Snap canvas on the football field
  $scope.field = Snap ('#football-field')

  # set a scoped reference to the field as 'field'
  field = $scope.field

  # initiate an empty array for the offensive players and set a scoped reference
  # to it as 'offense'
  $scope.offense = []
  offense = $scope.offense

  # create 11 svg text elements and push them into the offense array
  i = 0
  cx = 0
  cy = 0
  while i < 11
    fill = "white"
    fontSize = "48"
    player = field.text(cx, cy, "O")
    player.attr
      fill: fill
      fontSize: fontSize

    player.data "xOffset", cx
    player.data "cx", cx
    player.data "yOffset", cy
    player.data "cy", cy
    $scope.offense.push player
    i++

  # set variable references to each 'player' in the offense and give them initial
  # starting positions

  # QB
  qb = offense[0]
  qb.transform('T600, 600')
  # LT
  lt = offense[1]
  lt.transform('T500, 550')
  # LG
  lg = offense[2]
  lg.transform('T550, 550')
  # C
  c = offense[3]
  c.transform('T600, 550')
  # RG
  rg = offense[4]
  rg.transform('T650, 550')
  # RT
  rt = offense[5]
  rt.transform('T700, 550')
  # RB
  rb = offense[6]
  rb.transform('T600, 700')
  # TE
  te = offense[7]
  te.transform('T450, 550')
  # WR1
  wr1 = offense[8]
  wr1.transform('T1100, 550')
  # WR2
  wr2 = offense[9]
  wr2.transform('T100, 550')
  # WR3
  wr3 = offense[10]
  wr3.transform('T900, 550')

  # draw wr1 path
  wr1Path = field.path("M1100 550, 1100 200, 1075 225").attr(
    fill: 'none'
    strokeWidth: '4'
    stroke: 'white'
    strokeDasharray: '12 6'
  )

  #draw wr2 path
  wr3Path = field.path("M100 550, 100 375, 400 375").attr(
    fill: 'none'
    strokeWidth: '4'
    stroke: 'white'
    strokeDasharray: '12 6'
    )

  #draw wr3 path
  wr3Path = field.path("M900 550, 850 500, 850 0").attr(
    fill: 'none'
    strokeWidth: '4'
    stroke: 'yellow'
    strokeDasharray: '12 6'
    )

  #draw te path
  tePath = field.path("M450 550, 450 250, 700 250").attr(
    fill: 'none'
    strokeWidth: '4'
    stroke: 'white'
    strokeDasharray: '12 6'
    )

  #draw rb path
  rbPath = field.path("M600 700, 1150 650, 1175 550").attr(
    fill: 'none'
    strokeWidth: '4'
    stroke: 'white'
    strokeDasharray: '12 6'
    )

