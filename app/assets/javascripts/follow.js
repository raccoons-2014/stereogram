$('.small-block-grid-3').on('click', 'img.follow', function(event){
  var userId = event.currentTarget.dataset.userId
  debugger
  $.ajax({
    url: '/follows',
    method: 'POST',
    data: {follow:userId}
  }).done(function(response){
    debugger
    $('.follow_div_1').append(response)
  })
})
