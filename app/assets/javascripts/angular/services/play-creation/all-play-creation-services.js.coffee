app = angular.module 'creationServices', []

app.factory 'getPlays', ($http, $q) ->
  
  this.getAllPlays = () ->
    $http({method: 'GET', url: 'localhost:3000/offensive_plays'})

  

