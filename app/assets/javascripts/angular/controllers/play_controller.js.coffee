app = angular.module 'play.controller', []

app.controller 'PlayCtrl', @PlayCtrl = ($scope) ->

  $scope.pageClass = 'page-play'

  # set a scoped reference to the field as 'field'

  field = Snap ('#football-field')
  # initiate an empty array for the offensive players and set a scoped reference
  # to it as 'offense'
  $scope.offense = []
  offense = $scope.offense

  $scope.defense = []
  defense = $scope.defense

  # factory for drawing paths
  drawPath = (coordinates, team) ->
    pathNodes = coordinates.join(',')
    if team is offense
      stroke = "rgba(0, 0, 0, 1)"
    else
      stroke = ""

    newPath = field.path(pathNodes).attr
      fill: 'none'
      strokeWidth: '6'
      stroke: stroke
      strokeDasharray: '12 6'


  # factory for creating zones
  drawZone = (cx, cy, r) ->
    field.circle(cx, cy, r).attr
      fill: 'none'

  # draw zones for defensive players
  deepRight = drawZone(195, 150, 160)
  deepLeft = drawZone(1195, 150, 160)
  deepMiddle = drawZone(720, 50, 160)

  curlFlatRight = drawZone(250, 325, 100)
  middleHookRight = drawZone(525, 300, 100)
  middleHookLeft = drawZone(875, 300, 100)
  curlFlatLeft = drawZone(1140, 325, 100)

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

  lcbCoordinates = ["M1225 475", "1195 150"]
  rcbCoordinates = ["M165 475", "195 150"]
  leftSafetyCoordinates = ["M965 400", "875 300"]
  rightSafetyCoordinates = ["M515 250", "720 50"]
  leftLbCoordinates = ["M895 475", "1140 325"]
  rightLbCoordinates = ["M475 380", "250 325"]
  nickelCornerCoordinates = ["M600 200", "525 300"]
  leftDECoordinates = ["M815 475", "815 590"]
  dtCoordinates = ["M715 475", "715 570"]
  ntCoordinates = ["M625 475", "625 570"]
  rightDECoordinates = ["M550 475", "575 590"]

  #draw offensive player paths
  wr1Path = drawPath wr1Coordinates, offense
  wr2Path = drawPath wr2Coordinates, offense
  wr3Path = drawPath wr3Coordinates, offense
  tePath = drawPath teCoordinates, offense
  rbPath = drawPath rbCoordinates, offense
  qbPath = drawPath qbCoordinates, offense
  ltPath = drawPath ltCoordinates, offense
  lgPath = drawPath lgCoordinates, offense
  cPath = drawPath cCoordinates, offense
  rgPath = drawPath rgCoordinates, offense
  rtPath = drawPath rtCoordinates, offense

  lcbPath = drawPath lcbCoordinates
  rcbPath = drawPath rcbCoordinates
  leftSafetyPath = drawPath leftSafetyCoordinates
  rightSafetyPath = drawPath rightSafetyCoordinates
  leftLbPath = drawPath leftLbCoordinates
  rightLbPath = drawPath rightLbCoordinates
  nickelCornerPath = drawPath nickelCornerCoordinates
  leftDEPath = drawPath leftDECoordinates
  dtPath = drawPath dtCoordinates
  ntPath = drawPath ntCoordinates
  rightDEPath = drawPath rightDECoordinates

  # factory for creating players
  createPlayer = (team) ->
    if team is offense
      letter = "O"
      playerFill = "rgba(0, 0, 160, 1)"
    else
      letter = "X"
      playerFill = "rgba(220, 0, 0, 0.9)"

    player = field.text(0, 0, letter)
    player.attr
      fill: playerFill
      fontSize: "72"
      fontFamily: 'Roboto Slab'
      stroke: "rgba(255, 255, 255, 0.8)"
      strokeWidth: '2'

  # create the offensive players
  wr1 = field.group createPlayer offense
  wr2 = field.group createPlayer offense
  wr3 = field.group createPlayer offense
  te = field.group createPlayer offense
  rb = field.group createPlayer offense
  qb = field.group createPlayer offense
  lt = field.group createPlayer offense
  lg = field.group createPlayer offense
  c = field.group createPlayer offense
  rg = field.group createPlayer offense
  rt = field.group createPlayer offense

  # bunch all of the target routes together

  $scope.targetRoutes = [wr1Path, wr2Path, wr3Path, tePath, rbPath]

  $scope.availableTargets = ['wr1', 'wr2', 'wr3', 'te', 'rb']

  $scope.receivers = [wr1, wr2, wr3, te, rb]

  $scope.primaryReceiver = wr3

  $scope.primaryRoute = wr3Path

  $scope.setPrimaryTarget = (target) ->
    index = $scope.availableTargets.indexOf(target)
    $scope.targetRoutes.forEach (route) ->
      route.attr
        stroke: 'black'
        strokeWidth: '6'
    primaryRoute = $scope.targetRoutes[index]
    primaryRoute.attr
      stroke: 'red'
      strokeWidth: '8'
    $scope.primaryRoute = primaryRoute
    $scope.primaryReceiver = $scope.receivers[index]

  # factory for drawing a player's catch radius
  catchRadius = (player) ->
    area = field.circle(0, 0, 50).attr
      # fill: 'rgba(255, 255, 0, 0.6)'
      fill: 'none'
    player.add area

  lcb = field.group createPlayer(defense)
  rcb = field.group createPlayer(defense)
  leftSafety = field.group createPlayer(defense)
  rightSafety = field.group createPlayer(defense)
  leftLb = field.group createPlayer(defense)
  rightLb = field.group createPlayer(defense)
  nickelCorner = field.group createPlayer(defense)
  leftDE = field.group createPlayer(defense)
  dt = field.group createPlayer(defense)
  nt = field.group createPlayer(defense)
  rightDE = field.group createPlayer(defense)

  # factory for initializing players on their paths
  initPlayer = (path, player) ->
    initPoint = path.getPointAtLength(0)
    player.transform "T#{initPoint.x}, #{initPoint.y}"

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

  initPlayer lcbPath, lcb
  initPlayer rcbPath, rcb
  initPlayer leftSafetyPath, leftSafety
  initPlayer rightSafetyPath, rightSafety
  initPlayer leftLbPath, leftLb
  initPlayer rightLbPath, rightLb
  initPlayer nickelCornerPath, nickelCorner
  initPlayer leftDEPath, leftDE
  initPlayer dtPath, dt
  initPlayer ntPath, nt
  initPlayer rightDEPath, rightDE

  # draw the football hike path

  hikePathx = qbPath.getPointAtLength(0).x + 25
  hikePathy = qbPath.getPointAtLength(0).y - 20

  footballPath = field.path "M720 525, #{hikePathx} #{hikePathy}"
  
  # create that pigskin
  football = field.ellipse(0, 0, 15, 30).attr
    fill: 'rgba(105, 54, 24, 1)'

  initPlayer(footballPath, football)

  runRoute = (path, player, speed, targetReceiver) ->
    pathLength = path.getTotalLength()

    speed = speed || 2000

    Snap.animate 0, pathLength, ((value) ->
      movePoint = path.getPointAtLength(value)
      player.transform "T#{movePoint.x}, #{movePoint.y}"
      xDifference = Math.abs($scope.primaryReceiver.matrix.e - football.matrix.e)
      yDifference = Math.abs($scope.primaryReceiver.matrix.f - football.matrix.f)
      if (xDifference <= 50) and (yDifference <= 50)
        catchPass()
    ), speed

  # animate a player along their path

  runPlay = () ->

    qbWait = Math.floor(Math.random() * 1000)

    snapBall = () ->
      pathLength = footballPath.getTotalLength()

      Snap.animate 0, pathLength, ((value) ->
        movePoint = footballPath.getPointAtLength(value)
        football.transform "T#{movePoint.x}, #{movePoint.y}"
      ), 200

    snapBall()

    runRoute wr1Path, wr1, 1500
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

    runRoute lcbPath, lcb, 1000
    runRoute rcbPath, rcb, 1000
    runRoute leftSafetyPath, leftSafety, 1000
    runRoute rightSafetyPath, rightSafety, 1000
    runRoute leftLbPath, leftLb, 1000
    runRoute rightLbPath, rightLb, 1000
    runRoute nickelCornerPath, nickelCorner, 1000
    runRoute leftDEPath, leftDE, 625
    runRoute dtPath, dt, 650
    runRoute ntPath, nt, 650
    runRoute rightDEPath, rightDE, 625

  throwFootball = (targetReceiver, targetPath) ->
    yDiff = targetPath.getPointAtLength(0).y - targetReceiver.matrix.f

    startPointx = football.matrix.e
    startPointy = football.matrix.f
    endPointx = targetPath.getPointAtLength(yDiff*1.5).x
    endPointy = targetPath.getPointAtLength(yDiff*1.5).y

    startPoint = "#{startPointx} #{startPointy}"
    endPoint = "#{endPointx} #{endPointy}"
    pathCoordinates = "M#{startPoint}, #{endPoint}"

    newPath = field.path(pathCoordinates)

    initPlayer newPath, football

    runRoute(newPath, football, 350)

  $scope.hike = () ->
    runPlay()

  $scope.pass = () ->
    throwFootball($scope.primaryReceiver, $scope.primaryRoute)

  catchPass = () ->
    $scope.primaryReceiver.add football
    football.transform "T15, -15"


