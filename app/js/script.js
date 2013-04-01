$(function() {

  FB.init({
    appId: '437795012974751',
    xfbml: true
  });

  FB.getLoginStatus(function(response) {
    if (response.authResponse) {
      startRouter();  
    } else {
      FB.Event.subscribe('auth.login', function(response) {
        console.log('waiting for auth...');
        startRouter();
      });
    }
  });

  

});


function startRouter() {
  
  

  window.App = new MarathonMan();

  Backbone.history.start({
    pushState: true
  });

}