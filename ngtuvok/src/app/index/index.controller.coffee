angular.module "ngtuvok"
  .controller "IdxCtrl", ($scope, BlogService) ->
    $scope.title = "Welcome to T.V.K."
    $scope.slug = "These are our projects"

    $scope.posts = BlogService.getLastPost()

    return