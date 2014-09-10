app = angular.module 'creationServices', []

app.factory 'Plays',[ '$http', ($http) ->

  new class Plays
    constructor: ->
      @getAllPlays() 

    getAllPlays: ->
      $http(
        { method: 'GET', url: '/offensive_plays'}
      ).success((data) ->
        console.log data
      ).error(() ->
        console.log 'whoops'
      )
]
