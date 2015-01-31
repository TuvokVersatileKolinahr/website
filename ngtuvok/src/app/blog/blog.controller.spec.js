'use strict';

describe('controllers', function(){
  var scope;

  beforeEach(module('ngtuvok'));

  beforeEach(inject(function($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should at least have a title', inject(function($controller) {
    expect(scope.title).toBeUndefined();

    $controller('IdxCtrl', {
      $scope: scope
    });

    // expect(angular.isArray(scope.awesomeThings)).toBeTruthy();
    expect(scope.title.length > 5).toBeTruthy();
  }));
});
