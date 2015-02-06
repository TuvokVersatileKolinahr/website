angular.module "ngtuvok",
['ngAnimate',
'ngCookies',
'ngTouch',
'ngSanitize',
'ngResource',
'ngRoute',
'ngMaterial',
'firebase',
'btford.markdown']
  .config ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode(true)
    $routeProvider
      .when "/",
        templateUrl: "app/index/index.html"
        controller: "IdxCtrl"
      .when "/blog",
        templateUrl: "app/blog/blog.html"
        controller: "BlogCtrl"
      .when "/blog/:id",
        templateUrl: "app/blog/blogpost.html"
        controller: "BlogPostCtrl"
      .when "/builtwith",
        templateUrl: "app/main/main.html"
        controller: "MainCtrl"
      .when "/contact",
        templateUrl: "app/contact/contact.html"
        controller: "ContactCtrl"
      .when "/admin",
        templateUrl: "app/admin/admin.html"
        controller: "AdminCtrl"
      .when "/admin/posts/:id",
        templateUrl: "app/admin/post.html"
        controller: "AdminSinglePostCtrl"
      .otherwise
        redirectTo: "/"
