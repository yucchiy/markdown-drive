markdownDrive = angular.module 'MarkdownDrive', []

markdownDrive.controller 'DocumentsController', ($scope, $http) ->
  $scope.documents = null
  $scope.page = 1
  $scope.perPage = 20

  initialize = () ->
    $http.get("/api/documents/fetch.json")
    .success (response, status) ->
      $scope.documents = response.data
    .error (response, status) ->

  initialize()
  return

