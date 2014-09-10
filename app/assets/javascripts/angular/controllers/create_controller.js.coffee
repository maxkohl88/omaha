app = angular.module 'create.controller', ['creationServices']

app.controller "CreatePlayCtrl", @CreatePlayCtrl = ($scope, $http, Plays) ->

  $scope.pageClass = 'page-create'

  $scope.field = Snap '.create-play-field'

  $scope.basicOffense = () ->
    Plays.getAllPlays()


  $scope.basicDefense = () ->
    console.log "Draw some defense"
