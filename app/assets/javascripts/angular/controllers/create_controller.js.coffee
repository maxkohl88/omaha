app = angular.module 'create.controller', []

app.controller "CreatePlayCtrl", @CreatePlayCtrl = ($scope, $http) ->

  $scope.pageClass = 'page-create'

  $scope.field = Snap '.create-play-field'

  $scope.basicOffense = () ->
    $http(
      { method: 'GET', url: '/offensive_plays'}
    ).success((data) ->
      console.log data
    ).error(() ->
      console.log 'whoops'
    )

  $scope.basicDefense = () ->
    console.log "Draw some defense"
