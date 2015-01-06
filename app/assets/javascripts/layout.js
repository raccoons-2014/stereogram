$(document).ready(function(){

  $('#right.small-5.columns').mouseover(function() {
      $('#right.small-5.columns').animate({
        left:"140px"},500);
      $('.profile_image').css(
        "padding-left","17em");
      $('.username').show;
      $('.follow_div').show;
  })

  $('#right.small-5.columns').mouseleave(function() {
      $('#right.small-5.columns').animate({
        left:"625px"},500);
      $('.profile_image').css(
        "padding-left","3em");
      $('.username').hide;
      $('.follow_div').hide;
  })


  $('.row#audio').mouseover(function() {
      $(this).css(
        "background-color","#E8B504");
  })

  $('.row#audio').mouseleave(function() {
      $(this).css(
        "background-color","black");
  })

})