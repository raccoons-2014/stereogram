$('.small-block-grid-3').on('click', 'img.follow', function(event){
  var userId = event.currentTarget.dataset.userId
  $.ajax({
    url: '/follows',
    method: 'POST',
    data: {follow:userId}
  }).done(function(response){
    $('.follow-count').html(response)
  })
})