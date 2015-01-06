// $('img.expand_left').on("click", function() {
//     $('img.expand_left').hide()
//     $('#right.small-5.columns').animate({
//       left:"600px"},500);
//     $('.profile_image').css(
//       "padding-left","17em");
//     $('.username').show;
//     $('.follow_div').show;
//     $('img.expand_right').show()
// })

// $('img.expand_right').on("click", function() {
//     $(this).hide()
//     $('#right.small-5.columns').animate({
//       left:"1045px"},500);
//     $('.profile_image').css(
//       "padding-left","3em");
//     $('.username').hide;
//     $('.follow_div').hide;
//     $('img.expand_left').show()
// })


$('.row.collapse.track.partial').mouseover(function() {
    $(this).css(
      "background-color","#E8B504");
})

$('.row.collapse.track.partial').mouseleave(function() {
    $(this).css(
      "background-color","black");
})
