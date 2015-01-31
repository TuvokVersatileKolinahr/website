angular.module 'ngtuvok'
  .factory "BlogService", (DataFactory) ->
    # $resource '/api/posts'

    posts = DataFactory.query ->
      console.log posts
      return

    getLastPost: ->
      # return $resource.query ->
      return posts
