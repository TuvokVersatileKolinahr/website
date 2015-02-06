angular.module 'ngtuvok'
  .factory "DataFactory", ($resource) ->
    $resource '/api/collections/posts/:id', { id: '@_id' }, { update: { method: 'PUT' } }
