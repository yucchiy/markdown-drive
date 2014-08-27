markdownDrive = angular.module 'MarkdownDrive', []

markdownDrive.controller 'DocumentsController', ($scope, $http) ->
  $scope.documents = null

  initialize = () ->
    $http.get("/api/documents/fetch.json")
    .success (response, status) ->
      $scope.documents = response.data
    .error (response, status) ->

  initialize()
  return
