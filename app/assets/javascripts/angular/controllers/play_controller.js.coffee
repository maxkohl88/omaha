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

  # factory for drawing paths
  drawPath = (coordinates) ->
    pathNodes = coordinates.join(',')
    field.path(pathNodes).attr(
      fill: 'none'
      strokeWidth: '4'
      stroke: 'white'
      strokeDasharray: '12 6'
      )

  # set all player coordinates
  wr1Coordinates = ["M1100 550", "1100 200", "1075 225"]
  wr2Coordinates = ["M100 550", "100 375", "400 375"]
  wr3Coordinates = ["M900 550", "850 500", "850 0"]
  teCoordinates = ["M450 550", "450 250", "700 250"]
  rbCoordinates = ["M600 700", "1150 650", "1175 550"]
  qbCoordinates = ["M600 600", "600 650"]
  ltCoordinates = ["M500 550", "500 600"]
  lgCoordinates = ["M550 550", "550 600"]
  cCoordinates = ["M600 550", "600 600"]
  rgCoordinates = ["M650 550", "650 600"]
  rtCoordinates = ["M700 550", "700 600"]


  wr1Path = drawPath wr1Coordinates
  wr2Path = drawPath wr2Coordinates
  wr3Path = drawPath wr3Coordinates
  tePath = drawPath teCoordinates
  rbPath = drawPath rbCoordinates
  qbPath = drawPath qbCoordinates
  ltPath = drawPath ltCoordinates
  lgPath = drawPath lgCoordinates
  cPath = drawPath cCoordinates
  rgPath = drawPath rgCoordinates
  rtPath = drawPath rtCoordinates

  # draw the pigskin
  footballPath = field.path("M650 575, 850 150")

  # factory for creating players
  createPlayer = () ->
    player = field.text(0, 0, "O")
    player.attr
      fill: "white"
      fontSize: "48"

  # create the offensive players
  wr1 = createPlayer wr1Path
  wr2 = createPlayer wr2Path
  wr3 = createPlayer wr3Path
  te = createPlayer tePath
  rb = createPlayer rbPath
  qb = createPlayer qbPath
  lt = createPlayer ltPath
  lg = createPlayer lgPath
  c = createPlayer cPath
  rg = createPlayer rgPath
  rt = createPlayer rtPath

  # create that pigskin
  football = field.ellipse(0, 0, 10, 20).attr
    fill: 'rgba(105, 54, 24, 1)'
  

  # factory for initializing players on their paths
  initPlayer = (path, player) ->
    initPoint = path.getPointAtLength(0)
    player.transform 'T' + parseInt(initPoint.x) + ',' + parseInt(initPoint.y)

  #initialize players along their paths
  initPlayer wr1Path, wr1
  initPlayer wr2Path, wr2
  initPlayer wr3Path, wr3
  initPlayer tePath, te
  initPlayer rbPath, rb
  initPlayer ltPath, lt
  initPlayer lgPath, lg
  initPlayer cPath, c
  initPlayer rgPath, rg
  initPlayer rtPath, rt
  initPlayer qbPath, qb

  # animate a player along their path

  runRoute = (path, player, speed) ->
    pathLength = path.getTotalLength()

    speed = speed || 1500

    Snap.animate 0, pathLength, ((value) ->
      movePoint = path.getPointAtLength(value)
      player.transform 'T' + parseInt(movePoint.x) + ',' + parseInt(movePoint.y)
      ), speed

  runPlay = () ->
    runRoute wr1Path, wr1
    runRoute wr2Path, wr2
    runRoute wr3Path, wr3
    runRoute tePath, te
    runRoute rbPath, rb
    runRoute ltPath, lt
    runRoute lgPath, lg
    runRoute cPath, c
    runRoute rgPath, rg
    runRoute rtPath, rt
    runRoute qbPath, qb


    # throwFootball()

  hike = field.text(50, 50, "Hike!").attr(
    fill: 'white'
    fontSize: '36'
    )

  hike.node.onclick = () ->
    runPlay()


