angular.module "ngtuvok"
  .controller "IdxCtrl", ($scope, GitFactory) ->
    $scope.$parent.pagetitle = "Home"
    console.log 'bla'
    $scope.title = "Welcome to T.V.K."
    $scope.slug = "These are our projects"

    $scope.repos = GitFactory.query ->
      console.log "Repos", $scope.repos
      return

    return