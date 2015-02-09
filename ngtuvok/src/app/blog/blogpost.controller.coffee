angular.module "ngtuvok"
  .controller "BlogPostCtrl", ($scope, $routeParams, $location, BlogService) ->
    $scope.$parent.pagetitle = "Blog"

    $scope.post = BlogService.getPostById($routeParams.id)
    $scope.post.$promise.then((data) ->
      $scope.title = $scope.post.title
      $scope.slug = $scope.post.about
    )

    $scope.nextpost = BlogService.getNextPost($routeParams.id)
    $scope.nextpost.$promise.then((data) ->
      console.log "Next post:", data
      return
    )

    $scope.nextPost = ->
      $location.path('/blog/' + $scope.nextpost._id);
      return

    $scope.prevpost = BlogService.getPrevPost($routeParams.id)
    $scope.prevpost.$promise.then((data) ->
      console.log "Prev post:", data
      return
    )

    $scope.prevPost = ->
      $location.path('/blog/' + $scope.prevpost._id);
      return

    return