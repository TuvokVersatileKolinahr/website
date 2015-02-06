angular.module "ngtuvok",
['ngAnimate',
'ngCookies',
'ngTouch',
'ngSanitize',
'ngResource',
'ngRoute',
'ngMaterial',
'firebase']
  .config ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode(true)
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
      .when "/admin/:id",
        templateUrl: "app/admin/post.html"
        controller: "AdminCtrl"
      .when "/admin",
        templateUrl: "app/admin/admin.html"
        controller: "AdminCtrl"
      .otherwise
        redirectTo: "/"
