(function() {
  "use strict";

  angular
    .module("client", [
      "ui.router",
      "client.cities"
    ])
    .value('env', 'pollas');
})();
