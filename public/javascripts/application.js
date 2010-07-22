var enableRemoteForms = function(){
  var new_game_session_form = $('#new_game_session_form');
  if(new_game_session_form){
    new_game_session_form.delay(5000).ajaxForm({
    });
  };
};

$(document).ready(function() {	
  $("a.remote").fancybox({
    titleShow: false,
    onComplete: function(){
      enableRemoteForms();
    }
  })
});
