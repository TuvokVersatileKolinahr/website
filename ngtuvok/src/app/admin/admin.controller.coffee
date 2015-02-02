angular.module "ngtuvok"
  .controller "AdminCtrl", ($scope, $firebase) ->
    $scope.$parent.pagetitle = "Admin us"
    $scope.title = "Admin Pages"
    $scope.slug = "Administer me"
    $scope.noop = 'noop'

    ref = new Firebase("https://amber-fire-3343.firebaseio.com/")
    sync = $firebase(ref)
    $scope.data = sync.$asObject()

    $scope.login = ->
      ref.authWithOAuthPopup 'github', (error, authData) ->
        if error
          console.log 'Login Failed!', error
        else
          console.log 'Authenticated successfully with payload:', authData
        return
      return


    return
