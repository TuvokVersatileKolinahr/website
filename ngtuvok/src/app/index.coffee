angular.module "ngtuvok", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngResource', 'ngRoute', 'ngMaterial']
  .config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "app/index/index.html"
        controller: "IdxCtrl"
      .when "/blog",
        templateUrl: "app/blog/blog.html"
        controller: "BlogCtrl"
      .when "/builtwith",
        templateUrl: "app/main/main.html"
        controller: "MainCtrl"
      .when "/contact",
        templateUrl: "app/contact/contact.html"
        controller: "ContactCtrl"
      .otherwise
        redirectTo: "/"
