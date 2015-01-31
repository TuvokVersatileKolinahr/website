angular.module "ngtuvok"
  .controller "IdxCtrl", ($scope, GitFactory) ->
    $scope.title = "Welcome to T.V.K."
    $scope.slug = "These are our projects"

    $scope.repos = GitFactory.query ->
      console.log $scope.repos
      return


    return