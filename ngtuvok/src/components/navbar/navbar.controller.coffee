angular.module "ngtuvok"
  .controller "NavbarCtrl", ($scope) ->
    # $scope.date = new Date()
    $scope.user = $scope.$parent.displayName
    $scope.showlogin = $scope.$parent.showlogin
    $scope.links = [
      {url: '/', name: 'home'},
      {url: '/blog', name: 'blog'},
      {url: '/contact', name: 'contact'},
      {url: '/admin', name: 'admin'}
    ]
