angular.module 'ngtuvok'
  .factory "DataFactory", ($resource) ->
    $resource '/api/posts'