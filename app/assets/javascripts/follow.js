$('.small-block-grid-3').on('click', 'img.follow', function(event){
  var userId = event.currentTarget.dataset.userId
  $('img.follow').toggleClass("follow unfollow");

  $.ajax({
    url: '/follows',
    method: 'POST',
    data: {follow:userId}
  }).done(function(response){
    $('.follow-count').html(response)
  })
})

$('.small-block-grid-3').on('click', 'img.unfollow', function(event){
  var userId = event.currentTarget.dataset.userId
  $('img.unfollow').toggleClass("unfollow follow");

  $.ajax({
    url: '/follows/' + userId,
    method: 'DELETE',
    data: {id:userId}
  }).done(function(response){
    $('.follow-count').html(response)
  })
})
