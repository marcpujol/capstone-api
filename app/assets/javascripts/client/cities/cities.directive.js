(function() {
  'use strict';

  angular
    .module("client.cities")
    .directive("cities", CitiesDirective);

  CitiesDirective.$inject = ["client.APP_CONFIG"];
  function CitiesDirective(APP_CONFIG) {
    var directive = {
      templateUrl: APP_CONFIG.cities_path,
      replace: true,
      bindToController: true,
      controller: "client.cities.CitiesController",
      controllerAs: "citiesController",
      restrict: "E",
      scope: {}
    };
    return directive;
  }
}());
