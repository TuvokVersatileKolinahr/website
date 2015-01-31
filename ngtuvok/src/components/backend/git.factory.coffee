angular.module 'ngtuvok'
  .factory "GitFactory", ($resource) ->
    $resource 'https://api.github.com/users/TuvokVersatileKolinahr/repos'