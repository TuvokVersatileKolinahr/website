angular.module "ngtuvok"
  .controller "BlogPostCtrl", ($scope, $routeParams, BlogService) ->
    $scope.$parent.pagetitle = "Blog"

    $scope.post = BlogService.getPostById($routeParams.id)
    $scope.post.$promise.then((data) ->
      $scope.title = $scope.post.title
      $scope.slug = $scope.post.about
    )

    return