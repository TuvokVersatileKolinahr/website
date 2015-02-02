angular.module "ngtuvok"
  .controller "AdminCtrl", ($scope, $firebase) ->
    $scope.$parent.pagetitle = "Admin us"
    $scope.title = "Admin Pages"
    $scope.slug = "Administer me"
    $scope.noop = 'noop'
    $scope.username = ''

    ref = new Firebase("https://amber-fire-3343.firebaseio.com/")
    sync = $firebase(ref)
    $scope.data = sync.$asObject()

    $scope.login = ->
      console.log 'Leeloo Dallas multipass'
      myname = 'nobody'
      ref.authWithOAuthPopup 'github', (error, authData) ->
        if error
          console.log 'Login Failed!', error
          $scope.username = 'error'
        else
          debugger
          $scope.username = 'success'
          console.log 'Authenticated successfully with payload:', authData
        return
      $scope.username = myname
      return

    return
