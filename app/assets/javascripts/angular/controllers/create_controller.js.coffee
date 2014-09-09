app = angular.module 'create.controller', []

app.controller "CreatePlayCtrl", @CreatePlayCtrl = ($scope) ->

  $scope.pageClass = 'page-create'

  $scope.field = Snap '.create-play-field'

  $scope.basicOffense = () ->
    console.log "Draw some offense"

  $scope.basicDefense = () ->
    console.log "Draw some defense"
