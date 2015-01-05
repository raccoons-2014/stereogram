$(document).ready(function(){

  $('#right.small-5.columns').mouseover(function() {
      $('#right.small-5.columns').animate({
        left:"140px"},500);
  })

  $('#right.small-5.columns').mouseleave(function() {
      $('#right.small-5.columns').animate({
        left:"625px"},500);
  })
})