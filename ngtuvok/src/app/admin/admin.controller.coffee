angular.module "ngtuvok"
  .controller "AdminCtrl", ($scope, $firebase, BlogService) ->
    $scope.$parent.pagetitle = "Admin us"
    $scope.title = "Admin Pages"
    $scope.slug = "Administer me"
    $scope.noop = 'noop'
    $scope.showlogin = true
    
    ref = new Firebase("https://amber-fire-3343.firebaseio.com/")
    sync = $firebase(ref)
    $scope.data = sync.$asObject()
    $scope.posts = BlogService.getLastPost()

    ###***
    $scope.login = ->
      ref.authWithOAuthPopup 'github', (error, authData) ->
        if error
          console.log 'Login Failed!', error
          $scope.errormessage = error.code + ' ' + error.message
          # $mdDialog.show $mdDialog.alert()
          #   .title('This is an alert title')
          #   .content('You can specify some description text in here.')
          #   .ariaLabel('Password notification')
          #   .ok('Got it!')
          #   .targetEvent(ev)
          $scope.$apply()
        else
          console.log 'Authenticated successfully with payload:', authData
          $scope.displayName = authData.github.displayName
          delete $scope.errormessage
          $scope.$apply()
        return
    $scope.logout = ->
      ref.unauth
      delete $scope.displayName
      return
    ***###
    $scope.login = ->
      console.log "logged in"
      $scope.displayName = "Tester"
    $scope.logout = ->
      console.log "logged out"
      delete $scope.displayName

    #login on enter
    $scope.login()

    return
