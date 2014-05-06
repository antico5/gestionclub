$(document).ready(function(){

  $('#socio-search')
    .bind("ajax:beforeSend", function(evt, xhr, settings){
    	
    })
    .bind("ajax:success", function(evt, data, status, xhr){
      
    })	
    .bind('ajax:complete', function(evt, xhr, status){
      //$('tbody').empty();
      $('tbody').html(xhr.responseText);
    });
});