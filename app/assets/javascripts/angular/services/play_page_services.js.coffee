playPageServices = angular.module 'playPageServices', []

playPageServices.service 'Route', () ->
    # drawPath = (coordinates, team, field) ->
    #   pathNodes = coordinates.join(',')
    #   if team is offense
    #     stroke = "rgba(0, 0, 0, 1)"
    #   else
    #     stroke = ""

    #     newPath = field.path(pathNodes).attr
    #       fill: 'none'
    #       strokeWidth: '6'
    #       stroke: stroke
    #       strokeDasharray: '12 6'

  this.hello = () ->
    console.log 'hi im a route'
