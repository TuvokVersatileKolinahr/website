angular.module 'ngtuvok'
  .factory "BlogService", (DataFactory) ->
    # $resource '/api/posts'

    posts = DataFactory.query ->
      # console.log posts
      return

    getLastPost: ->
      # return $resource.query ->
      return posts

    getPostById: (id) ->
      post = DataFactory.get({ id: id }, ->
        console.log post
      )
      return post

    getPosts: (start, end) ->
      # return $resource.query ->
      return posts
