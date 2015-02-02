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
          $scope.errormessage = "Login Failed"
          # $mdDialog.show $mdDialog.alert()
          #   .title('This is an alert title')
          #   .content('You can specify some description text in here.')
          #   .ariaLabel('Password notification')
          #   .ok('Got it!')
          #   .targetEvent(ev)
          $scope.$apply()
        else
          console.log 'Authenticated successfully with payload:', authData
          $scope.username = authData.github.displayName
          delete $scope.errormessage
          $scope.$apply()
        return

    #login on enter
    $scope.login()

    return
