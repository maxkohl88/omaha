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
  wr1Coordinates = ["M1195 550", "1195 200", "1170 225"]
  wr2Coordinates = ["M195 550", "195 375", "495 375"]
  wr3Coordinates = ["M995 550", "945 500", "945 0"]
  teCoordinates = ["M545 550", "545 250", "795 250"]
  rbCoordinates = ["M745 650", "1245 650", "1270 550"]
  qbCoordinates = ["M695 650", "695 650"]
  ltCoordinates = ["M595 550", "595 640"]
  lgCoordinates = ["M645 550", "645 620"]
  cCoordinates = ["M695 550", "695 600"]
  rgCoordinates = ["M745 550", "745 620"]
  rtCoordinates = ["M795 550", "795 640"]


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

  # factory for creating players
  createPlayer = () ->
    player = field.text(0, 0, "O")
    player.attr
      fill: "white"
      fontSize: "48"

  # create the offensive players
  wr1 = field.group createPlayer() 
  wr2 = field.group createPlayer() 
  wr3 = field.group createPlayer() 
  te = field.group createPlayer() 
  rb = field.group createPlayer() 
  qb = field.group createPlayer() 
  lt = field.group createPlayer() 
  lg = field.group createPlayer() 
  c = field.group createPlayer() 
  rg = field.group createPlayer() 
  rt = field.group createPlayer()   

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

  # draw the football hike path

  hikePathx = qbPath.getPointAtLength(0).x + 25
  hikePathy = qbPath.getPointAtLength(0).y - 20

  hikeEnd = hikePathx + " " + hikePathy

  footballPath = field.path("M720 525," + hikeEnd)
  
  # create that pigskin
  football = field.ellipse(0, 0, 10, 20).attr
    fill: 'rgba(105, 54, 24, 1)'

  initPlayer(footballPath, football)

  # the center starts with the football

  # animate a player along their path

  runRoute = (path, player, speed) ->
    pathLength = path.getTotalLength()

    speed = speed || 1500

    Snap.animate 0, pathLength, ((value) ->
      movePoint = path.getPointAtLength(value)
      player.transform 'T' + parseInt(movePoint.x) + ',' + parseInt(movePoint.y)
      ), speed

  findTarget = (targetPath) ->
    startPointx = football.matrix.e
    startPointy = football.matrix.f
    endPointx = targetPath.getPointAtLength(1000).x
    endPointy = targetPath.getPointAtLength(1000).y

    startPoint = "M" + startPointx + " " + startPointy
    endPoint = endPointx + " " + endPointy
    pathCoordinates = startPoint + ", " + endPoint

    newPath = field.path(pathCoordinates).attr
      stroke: 'red'
      strokeWidth: '4'

    initPlayer newPath, football

    throwFootball = () ->
      runRoute(newPath, football, 500)

    setTimeout throwFootball, 780

  snapBall = () ->
    pathLength = footballPath.getTotalLength()

    Snap.animate 0, pathLength, ((value) ->
      movePoint = footballPath.getPointAtLength(value)
      football.transform 'T' + parseInt(movePoint.x) + ',' + parseInt(movePoint.y)
    ), 200, ->
      findTarget(wr1Path)


  runPlay = () ->
    snapBall()
    runRoute wr1Path, wr1
    runRoute wr2Path, wr2
    runRoute wr3Path, wr3
    runRoute tePath, te
    runRoute rbPath, rb
    runRoute ltPath, lt, 600
    runRoute lgPath, lg, 600
    runRoute cPath, c, 600
    runRoute rgPath, rg, 600
    runRoute rtPath, rt, 600
    runRoute qbPath, qb
    

  hike = field.text(50, 50, "Hike!").attr(
    fill: 'white'
    fontSize: '36'
    )

  hike.node.onclick = () ->
    runPlay()


