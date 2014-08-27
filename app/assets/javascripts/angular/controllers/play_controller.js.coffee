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

  $scope.defense = []
  defense = $scope.defense

  # factory for drawing paths
  drawPath = (coordinates, team) ->
    pathNodes = coordinates.join(',')
    if team is offense
      stroke = "white"
    else
      stroke = ""

    field.path(pathNodes).attr
      fill: 'none'
      strokeWidth: '4'
      stroke: stroke
      strokeDasharray: '12 6'
      
  # factory for creating zones
  drawZone = (cx, cy, r) ->
    field.circle(cx, cy, r).attr
      fill: 'rgba(122, 219, 218, 0.6)'

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


  # factory for creating players
  createPlayer = (team) ->
    if team is offense
      letter = "O"
    else
      letter = "X"

    player = field.text(0, 0, letter)
    player.attr
      fill: "white"
      fontSize: "48"

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

  lcb = field.group createPlayer(defense)
  rcb = field.group createPlayer(defense)
  leftSafety = field.group createPlayer(defense)
  rightSafety = field.group createPlayer(defense)
  leftLb = field.group createPlayer(defense)
  rightLb = field.group createPlayer(defense)
  nickelCorner = field.group createPlayer(defense)

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

  # draw the football hike path

  hikePathx = qbPath.getPointAtLength(0).x + 25
  hikePathy = qbPath.getPointAtLength(0).y - 20

  footballPath = field.path "M720 525, #{hikePathx} #{hikePathy}"
  
  # create that pigskin
  football = field.ellipse(0, 0, 10, 20).attr
    fill: 'rgba(105, 54, 24, 1)'

  initPlayer(footballPath, football)

  # the center starts with the football

  # animate a player along their path

  runPlay = () ->

    snapBall = () ->
      pathLength = footballPath.getTotalLength()

      Snap.animate 0, pathLength, ((value) ->
        movePoint = footballPath.getPointAtLength(value)
        football.transform "T#{movePoint.x}, #{movePoint.y}"
      ), 200

    snapBall()

    runRoute = (path, player, speed, hotRoute) ->
      pathLength = path.getTotalLength()

      speed = speed || 2000

      Snap.animate 0, pathLength, ((value) ->
        movePoint = path.getPointAtLength(value)
        player.transform "T#{movePoint.x}, #{movePoint.y}"
      ), speed

    runRoute wr1Path, wr1, 1500, true
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

    throwFootball = (targetReceiver) ->
      getPathPoint = (targetPath) ->
        pathLength = parseInt(targetPath.getTotalLength())
        i = 0
        while i < pathLength
          if (parseInt(targetPath.getPointAtLength(i).x) == parseInt(targetReceiver.matrix.e)) && (parseInt(targetPath.getPointAtLength(i).y) == (targetReceiver.matrix.f))
            console.log targetPath.getPointAtLength(i)
          i++

      getPathPoint wr1Path

      startPointx = football.matrix.e
      startPointy = football.matrix.f
      endPointx = targetReceiver.matrix.e
      endPointy = targetReceiver.matrix.f

      startPoint = "#{startPointx} #{startPointy}"
      endPoint = "#{endPointx} #{endPointy}"
      pathCoordinates = "M#{startPoint}, #{endPoint}"

      newPath = field.path(pathCoordinates).attr
        stroke: 'red'
        strokeWidth: '4'

      initPlayer newPath, football

      runRoute(newPath, football, 500)

    chuckIt = () ->
      throwFootball(wr1)

    setTimeout chuckIt, 500

  hike = field.text(50, 50, "Hike!").attr(
    fill: 'white'
    fontSize: '36'
    )

  hike.node.onclick = () ->
    runPlay()


