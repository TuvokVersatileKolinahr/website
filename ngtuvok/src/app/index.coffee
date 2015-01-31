angular.module "ngtuvok", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngResource', 'ngRoute', 'ngMaterial']
  .config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "app/index/index.html"
        controller: "IdxCtrl"
      .when "/builtwith",
        templateUrl: "app/main/main.html"
        controller: "MainCtrl"
      .when "/contact",
        templateUrl: "app/contact/contact.html"
        controller: "ContactCtrl"
      .otherwise
        redirectTo: "/"
