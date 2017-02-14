(function() {
  'use strict';

  angular
    .module("client")
    .config(RouterFunction);

  RouterFunction.$inject = ["$stateProvider", "$urlRouterProvider", "client.APP_CONFIG"];

  function RouterFunction($stateProvider, $urlRouterProvider, APP_CONFIG) {
    $stateProvider
      .state("home", {
        url: "/",
        templateUrl: APP_CONFIG.states_path
      });
    $urlRouterProvider.otherwise("/");
  }
}());
