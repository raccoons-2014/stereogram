$('.like').on('click', function(e){
  e.preventDefault();
  if(e.target.classList[0] === 'track-like'){
    var voteData = {track_id: e.target.parentElement.id}
  } else{
    var voteData = {snippet_id: e.target.parentElement.id}
  }
  like(voteData, e.target.parentElement.id)
})

var like = function(voteData, id){
  $.ajax({
    url: '/votes',
    method: 'POST',
    data: voteData
  }).done(function(response){
    $('#'+ id + '.score').html(response)
  })
}