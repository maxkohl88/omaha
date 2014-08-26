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
  createPlayer = (path) ->
    startingPoint = path.getPointAtLength(0)
    cx = startingPoint.x
    cy = startingPoint.y
    player = field.text(cx, cy, "O")
    player.attr
      fill: "white"
      fontSize: "48"
    
    player.data "xOffset", cx
    player.data "cx", cx
    player.data "yOffset", cy
    player.data "cy", cy

    return player

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


  football = field.ellipse(0, 0, 10, 20).attr(
    fill: 'rgba(105, 54, 24, 1)'
  ) 

  runPlay = () ->

    lenWr1 = wr1Path.getTotalLength()

    Snap.animate 0, lenWr1, ((value) ->
      wr1MovePoint = wr1Path.getPointAtLength(value)
      wr1.transform "T" + parseInt(wr1MovePoint.x) + ',' + parseInt(wr1MovePoint.y)
    ), 1500


  # # run the play
  # runPlay = () ->
  #   lenWr1 = wr1Path.getTotalLength()
  #   lenWr2 = wr2Path.getTotalLength()
  #   lenWr3 = wr3Path.getTotalLength()
  #   lenTe = tePath.getTotalLength()
  #   lenRb = rbPath.getTotalLength()
  #   lenFootball = footballPath.getTotalLength()

  #   Snap.animate 0, lenWr1, ((value) ->
  #     wr1MovePoint = wr1Path.getPointAtLength(value)
  #     console.log wr1MovePoint
  #     console.log wr1
  #     wr1.transform "T" + parseInt(wr1MovePoint.x - 25) + ',' + parseInt(wr1MovePoint.y - 25)
  #   ), 1500

    # Snap.animate 0, lenWr2, ((value) ->
    #   wr2MovePoint = wr2Path.getPointAtLength(value)
    #   wr2.transform "T" + parseInt(wr2MovePoint.x - 25) + ',' + parseInt(wr2MovePoint.y - 25)
    # ), 1500

    # Snap.animate 0, lenWr3, ((value) ->
    #   wr3MovePoint = wr3Path.getPointAtLength(value)
    #   wr3.transform "T" + parseInt(wr3MovePoint.x - 25) + ',' + parseInt(wr3MovePoint.y - 25)
    # ), 1500

    # Snap.animate 0, lenTe, ((value) ->
    #   teMovePoint = tePath.getPointAtLength(value)
    #   te.transform "T" + parseInt(teMovePoint.x - 25) + ',' + parseInt(teMovePoint.y - 25)
    # ), 1500

    # Snap.animate 0, lenRb, ((value) ->
    #   rbMovePoint = rbPath.getPointAtLength(value)
    #   rb.transform "T" + parseInt(rbMovePoint.x - 25) + ',' + parseInt(rbMovePoint.y - 25)
    # ), 1500

    # throwFootball = () ->
    #   Snap.animate 0, lenFootball, ((value) ->
    #     footballMovePoint = footballPath.getPointAtLength(value)
    #     football.transform "T" + parseInt(footballMovePoint.x - 25) + ',' + parseInt(footballMovePoint.y - 25)
    #     ), 1500

    # throwFootball()

  hike = field.text(50, 50, "Hike!").attr(
    fill: 'white'
    fontSize: '36'
    )

  hike.node.onclick = () ->
    runPlay()


