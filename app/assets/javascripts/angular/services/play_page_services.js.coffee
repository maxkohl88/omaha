playPageServices = angular.module 'playPageServices', []

playPageServices.service 'Route', () ->

  this.drawPath = (field, coordinates) ->
   pathNodes = coordinates.join ','

   newPath = field.path(pathNodes).attr
    fill: 'none'
    strokeWidth: '6'
    stroke: 'rgba(0, 0, 0, 1)'
    strokeDasharray: '12 6'

  
