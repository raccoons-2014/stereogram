$('.row.collapse.partial').mouseover(function() {
    $(this).css(
      "background-color","#E8B504");
    var span = $(this).find("span")
    span.css(
      "color","black");
})

$('.row.collapse.partial').mouseleave(function() {
    $(this).css(
      "background-color","black");
    var span = $(this).find("span")
      span.css(
      "color","#E8B504")
})
