angular.module "ngtuvok"
  .controller "ContactCtrl", ($scope) ->
    $scope.$parent.pagetitle = "Contact us"
    $scope.noop = 'noop'
