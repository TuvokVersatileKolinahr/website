angular.module "ngtuvok"
  .controller "BlogCtrl", ($scope, BlogService) ->
    $scope.title = "Welcome to T.V.K."
    $scope.slug = "These are our ramblings"

    $scope.posts = BlogService.getLastPost()

    return